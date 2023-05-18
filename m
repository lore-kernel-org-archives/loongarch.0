Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B017AB8
	for <loongarch@lists.linux.dev>; Thu, 18 May 2023 12:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E0FC433EF;
	Thu, 18 May 2023 12:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684412205;
	bh=mcVhlqWDf8YEu82NWeaJqSJVzk6m3lkRayQT2pSqDXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmbXU3e56GBnnNkZvZCmwpsx3YRc1CzpobjXZEOdmSKSv30d0nOyMjqCjfi1r52lQ
	 pArZ+xXZfYbIyqiE/iV2fmhW7lOIUAbB5w86aNzwGLjGf2hupBoOBchosk1k//gPQ5
	 1hwvtlCVPP/1NUNSuMl5q1x6Vxp2Ad5YuXk3FUyUCy6lYpSgpyVkKuEmMPNdgy1PFH
	 +C8ygesDu+JwAi3TMpupOvi2P1uNA+j/HfrxXaBmvCU41X0oCJccEzAkbr9cuTy8r+
	 qTbqSs5B/AMWBOHU9btRE2kMhd69U7NrF/7HK/TrW2gIN4eLd814PWo/44laW5atbA
	 I9EQZ3OZjCrDw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id AE68B403B5; Thu, 18 May 2023 09:16:42 -0300 (-03)
Date: Thu, 18 May 2023 09:16:42 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] perf symbol: Add LoongArch case in get_plt_sizes()
Message-ID: <ZGYXKnRZQh18D2Fd@kernel.org>
References: <1683615352-10794-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7waE0gmSU09YKJMHDAnj7BV7ukiLqWs+JzzLrHDG5z8w@mail.gmail.com>
 <20230518030618.GB1068119@leoy-yangtze.lan>
 <CAAhV-H6L9kNyGU2UrX7jyN_6O_pafSVSamP7DYHkzfMgmCxVXA@mail.gmail.com>
 <20230518032129.GC1068119@leoy-yangtze.lan>
 <CAAhV-H6_=qwheWvNozop2+9MexnOZQcva28xaeikCc49_DqABA@mail.gmail.com>
 <20230518040553.GE1068119@leoy-yangtze.lan>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230518040553.GE1068119@leoy-yangtze.lan>
X-Url: http://acmel.wordpress.com

Em Thu, May 18, 2023 at 12:05:53PM +0800, Leo Yan escreveu:
> On Thu, May 18, 2023 at 11:57:29AM +0800, Huacai Chen wrote:
> > On Thu, May 18, 2023 at 11:21 AM Leo Yan <leo.yan@linaro.org> wrote:
> > >
> > > On Thu, May 18, 2023 at 11:12:26AM +0800, Huacai Chen wrote:
> > > > On Thu, May 18, 2023 at 11:06 AM Leo Yan <leo.yan@linaro.org> wrote:
> > > > >
> > > > > On Thu, May 18, 2023 at 10:11:27AM +0800, Huacai Chen wrote:
> > > > > > Queued, thanks.
> > > > >
> > > > > The patch is fine for me.
> > > > >
> > > > > Should not perf patches are to be merged via Arnaldo's tree?
> > > >
> > > > I think both are OK, if Arnaldo takes this patch, I will drop it.
> > >
> > > A good practice is to firstly inquiry the maintainers.
> > >
> > > AFAIK, Arnaldo will test perf patches before sending out pull request;
> > > if perf patches are scattered out, it might be out of the testing
> > > radar.
> > OK, I know, thank you very much.
> 
> You are welcome!
> 
> I found the code base for bfd:
> https://github.com/bminor/binutils-gdb/blob/master/bfd/elfnn-loongarch.c
> 
> And this patch is consistent with above link, FWIW:
> 
> Reviewed-by: Leo Yan <leo.yan@linaro.org>

Thanks, applied.

- Arnaldo

