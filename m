Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51893EA9
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 03:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08D6C4339C
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 03:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684727473;
	bh=iHXQcTEqOHdqFl7Ii0SrqoQyI+qgnvvYnQjuyuYCNHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qud9SQZgS1AUgYCIy9Ef501Oq5fDCJNxxbZeHvuJPvLn8WG1raRYlCe+YB9nGPHtN
	 hxiu84fVbNrny2oY/YN/NcplnhNmR2uSoHfFSoQqBWlIwoAyDgGFOnsK++Wl7E4T4M
	 vqj1q+kRAejRidS0oe7qyse6r9lUGTtFqh2wiYjWR9TCwwu3+9pKoCUcTD3eMpVOBh
	 bzh+BBc4PwMRvpSfPriBMdLvdxIUUUWPO90G7IPn2FddQpf1HTtlK079tkkAddQF04
	 eIPc9uX+wtF2tYgWVAG5Jz7xk55nMbQb+LS0USOhMxBtQo5yZcAHiArJIA1CxAzFnY
	 oUP54C6xSqItA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-510e90d785fso6358986a12.2
        for <loongarch@lists.linux.dev>; Sun, 21 May 2023 20:51:13 -0700 (PDT)
X-Gm-Message-State: AC+VfDy9jq6/O3zTs0tFPY92d4B4yv2zEuag7OMJe63f8KjbyVZyO8Ml
	1UVSObu3OZZxvCsnYGMz+cBt9EF0jNTPb89U4eQ=
X-Google-Smtp-Source: ACHHUZ5cFGQ7SS6SL2LLtZLKwCqAYzl91jHrcUthWlRt26iUwJBvQ2edEts9/IXvAtx7p0dX9kFCPBYkjKvud/FpeXU=
X-Received: by 2002:a17:906:99c1:b0:969:f54c:dee2 with SMTP id
 s1-20020a17090699c100b00969f54cdee2mr9585739ejn.26.1684727471877; Sun, 21 May
 2023 20:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1683615352-10794-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7waE0gmSU09YKJMHDAnj7BV7ukiLqWs+JzzLrHDG5z8w@mail.gmail.com>
 <20230518030618.GB1068119@leoy-yangtze.lan> <CAAhV-H6L9kNyGU2UrX7jyN_6O_pafSVSamP7DYHkzfMgmCxVXA@mail.gmail.com>
 <20230518032129.GC1068119@leoy-yangtze.lan> <CAAhV-H6_=qwheWvNozop2+9MexnOZQcva28xaeikCc49_DqABA@mail.gmail.com>
 <20230518040553.GE1068119@leoy-yangtze.lan> <ZGYXKnRZQh18D2Fd@kernel.org>
In-Reply-To: <ZGYXKnRZQh18D2Fd@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 22 May 2023 11:50:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H40kQf5WD-8ozFwS6copfQaGtUJqm=nvQ6btXZnpDmZFA@mail.gmail.com>
Message-ID: <CAAhV-H40kQf5WD-8ozFwS6copfQaGtUJqm=nvQ6btXZnpDmZFA@mail.gmail.com>
Subject: Re: [PATCH] perf symbol: Add LoongArch case in get_plt_sizes()
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Leo Yan <leo.yan@linaro.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Arnaldo,

On Thu, May 18, 2023 at 8:16=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Thu, May 18, 2023 at 12:05:53PM +0800, Leo Yan escreveu:
> > On Thu, May 18, 2023 at 11:57:29AM +0800, Huacai Chen wrote:
> > > On Thu, May 18, 2023 at 11:21=E2=80=AFAM Leo Yan <leo.yan@linaro.org>=
 wrote:
> > > >
> > > > On Thu, May 18, 2023 at 11:12:26AM +0800, Huacai Chen wrote:
> > > > > On Thu, May 18, 2023 at 11:06=E2=80=AFAM Leo Yan <leo.yan@linaro.=
org> wrote:
> > > > > >
> > > > > > On Thu, May 18, 2023 at 10:11:27AM +0800, Huacai Chen wrote:
> > > > > > > Queued, thanks.
> > > > > >
> > > > > > The patch is fine for me.
> > > > > >
> > > > > > Should not perf patches are to be merged via Arnaldo's tree?
> > > > >
> > > > > I think both are OK, if Arnaldo takes this patch, I will drop it.
> > > >
> > > > A good practice is to firstly inquiry the maintainers.
> > > >
> > > > AFAIK, Arnaldo will test perf patches before sending out pull reque=
st;
> > > > if perf patches are scattered out, it might be out of the testing
> > > > radar.
> > > OK, I know, thank you very much.
> >
> > You are welcome!
> >
> > I found the code base for bfd:
> > https://github.com/bminor/binutils-gdb/blob/master/bfd/elfnn-loongarch.=
c
> >
> > And this patch is consistent with above link, FWIW:
> >
> > Reviewed-by: Leo Yan <leo.yan@linaro.org>
>
> Thanks, applied.
I'm very sorry that this patch breaks cross-build. We need some
additional modification.

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 5d409c26a22e..b3dbf6ca99a7 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -35,6 +35,10 @@
 #define EM_AARCH64     183  /* ARM 64 bit */
 #endif

+#ifndef EM_LOONGARCH
+#define EM_LOONGARCH   258
+#endif
+
 #ifndef ELF32_ST_VISIBILITY
 #define ELF32_ST_VISIBILITY(o) ((o) & 0x03)
 #endif

Then, drop this patch to get an updated version, or let me send an
incremental patch?

Huacai

>
> - Arnaldo
>
