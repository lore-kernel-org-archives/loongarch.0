Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFF37D
	for <loongarch@lists.linux.dev>; Sat, 27 May 2023 01:55:54 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5289ce6be53so2009453a12.0
        for <loongarch@lists.linux.dev>; Fri, 26 May 2023 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685152554; x=1687744554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50rkrbLJVVboYecgPYKgeMphE+OaVJjRPZM9miVDUhs=;
        b=beCPuV/V7OuI1suBCjYxRtMGlT8BPdjHbEpyfLnUqawZaYHZufceQol3xzTW7DIa7C
         4ON+4K3zgdZghca/FQpzCbilB2zdHd3r67P46lUIK+xbsmLyB4Vdp0lUtcu1U8BsuNSt
         s1uFfCd0ZvhVhpPAmfRt8BR4MIZuNg8PXPSOq9cHDKIIPOhvm50GuFnB4dppetq4XS7P
         ePc9Wuor+9IPHVhgxTBnWUAOAlYC6q4AG6TKBhfwAl2RVmUAhB2wp0+uDFSV2q7vLzHP
         FU05kJXzYcR3WVTBrk/K9dZV8QHWcz2CIUXzAm7TMO+7MO02eBY6tE99QqEpZO287g6t
         8glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685152554; x=1687744554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50rkrbLJVVboYecgPYKgeMphE+OaVJjRPZM9miVDUhs=;
        b=Tu42EyvVGAk7yNCyWnS8DjdWzG7KHHYVPsPCvPG7Hu7+AnWZ64eZzmUoWwmbnTlVvA
         YC9wT3OhFeVnlEberO8nF5Wj2vrDKbCTzFWhUv0zbLrFJwn6suLTwMbEFLhQsrIizyP9
         Jg4RIEtorrC01TedESjOmQ66t2LMak7WnrThAeB+Rc2+1s1UK7QYmoiQbuq3pYtJRHY6
         lIzYXHxdFAofl5L08V6cYfarMscBPvKCJWQv7yRw+EL/CpQbE4PQ2lUZ3BRRsBeY70eK
         X799imznvuWn4NcIea0PpaTVWr+S0g8FnRc3D/UkoaPWHs1lH2bFiv0td5jW0UrQMch/
         RW+g==
X-Gm-Message-State: AC+VfDxLjvachyd+QkaoUtE/YFKP85yWv1kZu0o/taJP2dgcc47OpRQP
	dKKqbHpl93VCqIRVu5P91ZqZwg==
X-Google-Smtp-Source: ACHHUZ5cJy6CAykc9hMzO8zTqghMwRVEw6pl5aSVIDGDnBXSeoSTj2Ojvo+hf5XAxS+c2G4Hk0XjPA==
X-Received: by 2002:a17:903:41c3:b0:1af:f253:24b1 with SMTP id u3-20020a17090341c300b001aff25324b1mr1095383ple.9.1685152553710;
        Fri, 26 May 2023 18:55:53 -0700 (PDT)
Received: from leoy-huanghe ([107.151.177.130])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902ce8c00b0019aaab3f9d7sm3838026plg.113.2023.05.26.18.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:55:53 -0700 (PDT)
Date: Sat, 27 May 2023 09:55:20 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Hans-Peter Nilsson <hp@axis.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 2/2] perf LoongArch: Simplify mksyscalltbl
Message-ID: <20230527015520.GB188137@leoy-huanghe>
References: <1684837327-18203-1-git-send-email-yangtiezhu@loongson.cn>
 <1684837327-18203-3-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684837327-18203-3-git-send-email-yangtiezhu@loongson.cn>

On Tue, May 23, 2023 at 06:22:07PM +0800, Tiezhu Yang wrote:
> In order to print the numerical entries of the syscall table,
> there is no need to call the host compiler to build and then
> run a program, this can be done directly by the shell script.
> 
> This is similar with commit 9854e7ad35fe ("perf arm64: Simplify
> mksyscalltbl").
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  .../arch/loongarch/entry/syscalls/mksyscalltbl     | 32 ++++++----------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl b/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
> index c52156f..d7d97d5 100755
> --- a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
> +++ b/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
> @@ -22,40 +22,24 @@ create_table_from_c()

Nitpick: since this patch tries to remove the temporary C program and
simply use shell to generate syscall table, to avoid confusion, it's
good to update the function name from create_table_from_c() to
create_sc_table().

I know Arm64's mksyscalltbl has the same issue, we can use a separate
patch to address it.

Otherwise, this patch LGTM:

Reviewed-by: Leo Yan <leo.yan@linaro.org>
