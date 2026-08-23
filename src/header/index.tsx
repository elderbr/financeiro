export default function Header() {
    return (
        <header className="border-b border-slate-200 bg-white/90 backdrop-blur sticky top-0 z-50 shadow-sm no-print">
            <div className="max-w-7xl mx-auto px-4 py-4 flex flex-wrap justify-between items-center gap-4">
                <div className="flex items-center gap-3">
                    <div className="bg-indigo-600 p-2 rounded-xl text-white shadow-lg shadow-indigo-600/20">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="wallet" aria-hidden="true" className="lucide lucide-wallet w-6 h-6"><path d="M19 7V4a1 1 0 0 0-1-1H5a2 2 0 0 0 0 4h15a1 1 0 0 1 1 1v4h-3a2 2 0 0 0 0 4h3a1 1 0 0 0 1-1v-2a1 1 0 0 0-1-1"></path><path d="M3 5v14a2 2 0 0 0 2 2h15a1 1 0 0 0 1-1v-4"></path></svg>
                    </div>
                    <div>
                        <h1 className="text-xl font-bold tracking-wide text-slate-900">Planejamento &amp; Cartões Pro</h1>
                        <p className="text-xs text-slate-500">Gestão Integral: Renda, Metas, Parcelamentos, Faturas e Reembolsos</p>
                    </div>
                </div>

                <div className="flex flex-wrap items-center gap-2">
                    <div className="flex items-center gap-1 bg-slate-100 p-1.5 rounded-xl border border-slate-200">
                        <label className="text-xs font-semibold text-slate-600 pl-2">Mês Ref:</label>
                        <select id="selected-month-select" className="bg-white text-slate-800 font-bold border border-slate-300 rounded-lg px-2.5 py-1 text-xs sm:text-sm focus:outline-none focus:border-indigo-500 shadow-sm"><option value="2026-07">Julho / 2026</option><option value="2026-08" selected="">Agosto / 2026</option><option value="2026-09">Setembro / 2026</option></select>
                        <button className="p-1 hover:bg-slate-200 rounded-lg text-slate-600 transition" title="Adicionar Novo Mês">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="calendar-plus" aria-hidden="true" className="lucide lucide-calendar-plus w-4 h-4"><path d="M16 18h6"></path><path d="M16 2v3"></path><path d="M19 15v6"></path><path d="M21 11.5V5a2 2 0 00-2-2H5a2 2 0 00-2 2v14a2 2 0 002 2h8.3"></path><path d="M3 9h18"></path><path d="M8 2v3"></path></svg>
                        </button>
                        <button className="p-1 hover:bg-rose-50 rounded-lg text-rose-600 transition" title="Excluir mês selecionado">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="trash-2" aria-hidden="true" className="lucide lucide-trash-2 w-4 h-4"><path d="M10 11v6"></path><path d="M14 11v6"></path><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path><path d="M3 6h18"></path><path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                        </button>
                    </div>

                    <button className="bg-amber-600 hover:bg-amber-700 text-white px-3 py-2 rounded-lg text-xs sm:text-sm font-medium transition flex items-center gap-1.5 shadow-md shadow-amber-600/20">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="camera" aria-hidden="true" className="lucide lucide-camera w-4 h-4"><path d="M13.997 4a2 2 0 0 1 1.76 1.05l.486.9A2 2 0 0 0 18.003 7H20a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h1.997a2 2 0 0 0 1.759-1.048l.489-.904A2 2 0 0 1 10.004 4z"></path><circle cx="12" cy="13" r="3"></circle></svg> <span className="hidden sm:inline">Scanner Foto</span>
                    </button>

                    <button className="bg-emerald-600 hover:bg-emerald-700 text-white px-3 py-2 rounded-lg text-xs sm:text-sm font-medium transition flex items-center gap-1.5 shadow-md shadow-emerald-600/20">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="plus-circle" aria-hidden="true" className="lucide lucide-plus-circle w-4 h-4"><circle cx="12" cy="12" r="10"></circle><path d="M8 12h8"></path><path d="M12 8v8"></path></svg> <span className="hidden sm:inline">Novo Lançamento</span>
                    </button>

                    <button className="bg-indigo-600 hover:bg-indigo-700 text-white px-3 py-2 rounded-lg text-xs sm:text-sm font-medium transition flex items-center gap-1.5 shadow-md shadow-indigo-600/20">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="file-up" aria-hidden="true" className="lucide lucide-file-up w-4 h-4"><path d="M6 22a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h8a2.4 2.4 0 0 1 1.704.706l3.588 3.588A2.4 2.4 0 0 1 20 8v12a2 2 0 0 1-2 2z"></path><path d="M14 2v5a1 1 0 0 0 1 1h5"></path><path d="M12 12v6"></path><path d="m15 15-3-3-3 3"></path></svg> <span className="hidden sm:inline">Importar</span>
                    </button>

                    <div className="flex items-center gap-1 bg-indigo-50 p-1 rounded-xl border border-indigo-100">
                        <button className="px-2.5 py-1.5 hover:bg-white text-emerald-700 rounded-lg transition flex items-center gap-1.5 text-xs font-bold" title="Salvar as movimentações no navegador sem baixar um novo arquivo">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="save" aria-hidden="true" className="lucide lucide-save w-4 h-4"><path d="M15.2 3a2 2 0 0 1 1.4.6l3.8 3.8a2 2 0 0 1 .6 1.4V19a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2z"></path><path d="M17 21v-7a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v7"></path><path d="M7 3v4a1 1 0 0 0 1 1h7"></path></svg><span className="hidden sm:inline">Salvar</span>
                        </button>
                        <button className="px-2.5 py-1.5 hover:bg-white text-indigo-700 rounded-lg transition flex items-center gap-1.5 text-xs font-bold" title="Compartilhar ou sincronizar os dados com outro dispositivo">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="link" aria-hidden="true" className="lucide lucide-link w-4 h-4"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg><span className="hidden sm:inline">Compartilhar</span>
                        </button>
                        <button className="p-1.5 hover:bg-white text-indigo-700 rounded-lg transition" title="Carregar sessão ou código de sincronização">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="cloud-download" aria-hidden="true" className="lucide lucide-cloud-download w-4 h-4"><path d="M12 13v8l-4-4"></path><path d="m12 21 4-4"></path><path d="M4.393 15.269A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.436 8.284"></path></svg>
                        </button>
                    </div>
                    <button className="p-1.5 hover:bg-white text-indigo-700 rounded-lg transition" title="Sincronização e segurança">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="cloud-cog" aria-hidden="true" className="lucide lucide-cloud-cog w-4 h-4"><path d="m10.852 19.772-.383.924"></path><path d="m13.148 14.228.383-.923"></path><path d="M13.148 19.772a3 3 0 1 0-2.296-5.544l-.383-.923"></path><path d="m13.53 20.696-.382-.924a3 3 0 1 1-2.296-5.544"></path><path d="m14.772 15.852.923-.383"></path><path d="m14.772 18.148.923.383"></path><path d="M4.2 15.1a7 7 0 1 1 9.93-9.858A7 7 0 0 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.2"></path><path d="m9.228 15.852-.923-.383"></path><path d="m9.228 18.148-.923.383"></path></svg>
                    </button>

                    <div className="flex items-center gap-1 bg-slate-200/60 p-1 rounded-xl">
                        <button className="p-1.5 hover:bg-white text-slate-700 rounded-lg transition" title="Exportar Backup (JSON)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="download" aria-hidden="true" className="lucide lucide-download w-4 h-4"><path d="M12 15V3"></path><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><path d="m7 10 5 5 5-5"></path></svg>
                        </button>
                        <button className="p-1.5 hover:bg-white text-slate-700 rounded-lg transition" title="Restaurar Backup (JSON)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="upload" aria-hidden="true" className="lucide lucide-upload w-4 h-4"><path d="M12 3v12"></path><path d="m17 8-5-5-5 5"></path><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path></svg>
                        </button>
                        <input type="file" id="import-backup-file" accept=".json" className="hidden" />
                        <button className="p-1.5 hover:bg-white text-indigo-600 rounded-lg transition" title="Gerar Relatório PDF / Imprimir">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="printer" aria-hidden="true" className="lucide lucide-printer w-4 h-4"><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path><path d="M6 9V3a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6"></path><rect x="6" y="14" width="12" height="8" rx="1"></rect></svg>
                            </button>
                    </div>
                </div>
            </div>
        </header>
    )
}