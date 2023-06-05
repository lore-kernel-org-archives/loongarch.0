Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573179D9
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 14:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDDCC433D2;
	Mon,  5 Jun 2023 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685976254;
	bh=R6GScf/2m/FE3MMjEUfQt6ds1jbix6HnFEj8CKPfcI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/Isot8NJ9Dh8zyeRrG1spNbywS4TZpCCEA8icuEqSxJglUMyqu+minuFosPpGoH0
	 Qh+oBq9+pqvynpxX111TyfOID3K7GueWiGMXVH8AOO+CPGRwxDorZYQnnAgFP0uS2g
	 Hset6NuJ5jCBrBEXMyRupOvms2E0o/dVSr3BQbkm3MaxIt1fdONyz9WKlITc1vGb0Q
	 DHShieACNz1sjpp7KEjKmpysG2Gu5ewTGDVejZCuWlAKx8XAGJLBXfAMoi65zmIvdM
	 ca803T3EL3QEDeFbLqq/SIS1p/3sKYKkridQYH9yMLzPRXqEU1gqmXyKuB2x04RbUs
	 ng71KhrNREl1Q==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 3FB3040692; Mon,  5 Jun 2023 11:44:11 -0300 (-03)
Date: Mon, 5 Jun 2023 11:44:11 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH RESEND v3 0/5] perf tools: Modify mksyscalltbl
Message-ID: <ZH30uwj7S72vxoX1@kernel.org>
References: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
 <CAP-5=fXvN1b+_krmFSL2=C31WZ3zKafnq=Bqw3ruBKFNzG_8Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXvN1b+_krmFSL2=C31WZ3zKafnq=Bqw3ruBKFNzG_8Kw@mail.gmail.com>
X-Url: http://acmel.wordpress.com

Em Tue, May 30, 2023 at 12:03:30PM -0700, Ian Rogers escreveu:
> On Tue, May 30, 2023 at 3:10 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> > I'm sorry, somehow the patchset didn't reach mailing lists.
> > Resending with a fewer people in the cc list, which probably
> > was the reason.
> >
> > Thanks Alexander, Leo and Ian for your reviews and suggestions.
> 
> Thanks for the consts!
> 
> Acked-by: Ian Rogers <irogers@google.com>

Thanks, applied.

- Arnaldo

 
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

-- 

- Arnaldo
