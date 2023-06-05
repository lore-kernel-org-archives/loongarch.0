Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9379D9
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 14:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3B6C433D2;
	Mon,  5 Jun 2023 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685976272;
	bh=P4tmsurHnR8oymLXkCCN1+yzfSSIoKX5T6gyAEC+nAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOw2zhQV9DVeCo+SyrJIs/1PupzXl85bHQXkC53dV00RR9kgvNEvUAhRutOwYc67S
	 m4Psn5ErNYwh7+EpOBXK07wKKGtpAjXVkg5MHlXDMvVUlFQThHV3QhiDHExNOHtfSG
	 rveNrNZIiJhyouIDmDmD1GMV5i1+D9KIqBAjhFGQuN1ebByxqQfSQOGwroymikiQvD
	 Q/r9zEKIURv2u2PGGmOan3i0dHlnLP2HHC4bwO89xr+p+1z9HSQ/k3taIisCiYFixZ
	 8NU5/STrqE+z8Nf7sf+sfMgDtIL7O3dY828oEfWAP49w43OPLhF1sqBJUDptK2yGpp
	 7OX24EtDxOLSg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 8995D40692; Mon,  5 Jun 2023 11:44:30 -0300 (-03)
Date: Mon, 5 Jun 2023 11:44:30 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH RESEND v3 0/5] perf tools: Modify mksyscalltbl
Message-ID: <ZH30zvFRQabaeq0b@kernel.org>
References: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7EjxoVg_FAV2hTAKjZYJJEeHiDcfo21=z3OYstboSvxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7EjxoVg_FAV2hTAKjZYJJEeHiDcfo21=z3OYstboSvxw@mail.gmail.com>
X-Url: http://acmel.wordpress.com

Em Wed, May 31, 2023 at 03:58:41PM +0800, Huacai Chen escreveu:
> For the whole series,
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Thanks, added to the patches.

- Arnaldo
 
> On Tue, May 30, 2023 at 6:10 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> > I'm sorry, somehow the patchset didn't reach mailing lists.
> > Resending with a fewer people in the cc list, which probably
> > was the reason.
> >
> > Thanks Alexander, Leo and Ian for your reviews and suggestions.
> >
> > v3:
> >   -- Add a new patch to declare syscalltbl_*[] as const for all archs,
> >      suggested by Ian.
> >   -- Add a new patch to use max_nr to define SYSCALLTBL_ARM64_MAX_ID.
> >
> > v2:
> >   -- Add a new patch to rename create_table_from_c()
> >      to create_sc_table(), suggested by Leo.
> >   -- Simplify the shell script, suggested by Alexander.
> >
> > Tiezhu Yang (5):
> >   perf tools: Declare syscalltbl_*[] as const for all archs
> >   perf arm64: Rename create_table_from_c() to create_sc_table()
> >   perf arm64: Handle __NR3264_ prefixed syscall number
> >   perf arm64: Use max_nr to define SYSCALLTBL_ARM64_MAX_ID
> >   perf LoongArch: Simplify mksyscalltbl
> >
> >  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  | 17 ++++-----
> >  .../arch/loongarch/entry/syscalls/mksyscalltbl     | 40 +++++++---------------
> >  tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  2 +-
> >  .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  2 +-
> >  tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  2 +-
> >  tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  2 +-
> >  tools/perf/util/syscalltbl.c                       | 14 ++++----
> >  7 files changed, 32 insertions(+), 47 deletions(-)
> >
> > --
> > 2.1.0
> >
> >

-- 

- Arnaldo
