Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393F187C
	for <loongarch@lists.linux.dev>; Wed, 24 May 2023 06:43:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f603d4bc5bso6917905e9.3
        for <loongarch@lists.linux.dev>; Tue, 23 May 2023 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684910633; x=1687502633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk6upt+vsp22fV0++FGxdKmhDI8OOl/jL66VSuvL1JM=;
        b=AxTSMOstnaCEH6JLjXZ30ppxzYQ3gx4X0lJps4UcVJnw5vRPswnqJwfk8CYMqfRPr4
         opcE4dpKqAfWzoiv3xfPmIhzQTjpch5wscao9Y0sycTStG6q100U8ksj+Bin6F/4tvdr
         xqrdSrRwL5VtstDm64URGQmtDKj8PXNf/1Wp87mGYcH3hTfI/0gOnLwnHa0DpihSWB1e
         Lt3J9POr3MLWbh1QTVsnWpR2zh0zah1gCKpLYDF9UIHQgQ4RPDzdHAo8W4Icc9yhBkj9
         tzD39+/S9vIhYNyn2/sg8Tb8PrB+7Igl2KZALyOaoPHfpwzdQ/nSn49HEDiWfHqVvvzs
         0jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684910633; x=1687502633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zk6upt+vsp22fV0++FGxdKmhDI8OOl/jL66VSuvL1JM=;
        b=FSqekInI0ji0wiQjmuRyfIE4I1t5bMlmosrDhI+N0kHzfVTOmT3AOzagdSssgW7PTa
         0XdFSpBYcNOIjlYtDjolBprJeBUSHDTKKZI1xNIh6bBBtArVrct5ntr3ChizNUCr6W6g
         MB9OkQzHixi/n6DTHfZEMcqxpnus6sNW3+GGWBRNYfuX8hRBqH52247m/O2SFpElhUvi
         8ChOKJw9Wrz1cdnTlMrHRBv3t8uAtP1t4HngEsuMxlJttK8rgvg/o6HXjt4PcvdPhlq5
         78zfFqAdo3eZOpcHHdhCaneTjh3kBBFwhuhP5LH5Wq3djHOOZhZgElN5jH39nftMvHJA
         20yA==
X-Gm-Message-State: AC+VfDy4/frxY6rYEZxTaAcVs7tv47Et7XFbcHj8rrtAJjJKjkp8pzDo
	BwZT1ANb/uu5Bx/ZEqHF+HxlZ4aTBJB+Sg54foU=
X-Google-Smtp-Source: ACHHUZ4QMq9vrYxYRJbuOvFf+VzJiwYOaYoO+O+HFuEtol5pJ+0yyOn0JHLMYZu524VVWgLx4kJjNJwyzL+wyIB+xCU=
X-Received: by 2002:a05:600c:3795:b0:3f4:2737:a016 with SMTP id
 o21-20020a05600c379500b003f42737a016mr12308388wmr.29.1684910632858; Tue, 23
 May 2023 23:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1684837327-18203-1-git-send-email-yangtiezhu@loongson.cn>
 <1684837327-18203-2-git-send-email-yangtiezhu@loongson.cn>
 <CAJ1xhMUZoO66b=LNVnjBN1GbHvXdo2b2y+YeONC36Ok=Xn5XFg@mail.gmail.com> <49e98308-ab8d-5811-66a8-9e17f22bb8c4@loongson.cn>
In-Reply-To: <49e98308-ab8d-5811-66a8-9e17f22bb8c4@loongson.cn>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Wed, 24 May 2023 09:43:17 +0300
Message-ID: <CAJ1xhMV=WaYbdGpiRedLUGnYp8JLzcP81Ksw1k1610xeHCiGBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf arm64: Handle __NR3264_ prefixed syscall number
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Hans-Peter Nilsson <hp@axis.com>, Leo Yan <leo.yan@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 6:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
>
>
> On 05/23/2023 08:31 PM, Alexander Kapshuk wrote:
> > On Tue, May 23, 2023 at 1:22=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> After commit 9854e7ad35fe ("perf arm64: Simplify mksyscalltbl"),
> >> in the generated syscall table file syscalls.c, there exist some
> >> __NR3264_ prefixed syscall numbers such as [__NR3264_ftruncate],
> >> it looks like not so good, just do some small filter operations
> >> to handle __NR3264_ prefixed syscall number as a digital number.
> >>
> >> Without this patch:
> >>
> >>   [__NR3264_ftruncate] =3D "ftruncate",
> >>
> >> With this patch:
> >>
> >>   [46] =3D "ftruncate",
> >>
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl b/tools=
/perf/arch/arm64/entry/syscalls/mksyscalltbl
> >> index 22cdf91..59ab7939 100755
> >> --- a/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
> >> +++ b/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
> >> @@ -39,7 +39,8 @@ create_table()
> >>         echo "};"
> >>  }
> >>
> >> -$gcc -E -dM -x c -I $incpath/include/uapi $input \
> >> -       |sed -ne 's/^#define __NR_//p' \
> >> -       |sort -t' ' -k2 -n             \
> >> +$gcc -E -dM -x c -I $incpath/include/uapi $input               \
> >> +       |awk '{if ($2~"__NR" && $3 !~"__NR3264_") {print}}'     \
> >> +       |sed -ne 's/^#define __NR_//p;s/^#define __NR3264_//p'  \
> >> +       |sort -t' ' -k2 -n                                      \
> >>         |create_table
> >> --
> >> 2.1.0
> >>
> >
> > As an aside, the awk + sed + sort parts of the command line may be
> > reduced to the following awk script, if desired:
> > awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
> >         sub("^#define __NR_", "")
> >         sub("^#define __NR3264_", "")
> >         print | "sort -k2 -n"
> > }'
> >
>
> Hi Alexander,
>
> Thanks, it seems more simple and works well as expected.
> Let us wait for more review comments before respin.
>
> If no any objections, I will send v2 with the following
> changes based on the current patch in the next week.
>
> -$gcc -E -dM -x c -I $incpath/include/uapi $input               \
> -       |awk '{if ($2~"__NR" && $3 !~"__NR3264_") {print}}'     \
> -       |sed -ne 's/^#define __NR_//p;s/^#define __NR3264_//p'  \
> -       |sort -t' ' -k2 -n                                      \
> +$gcc -E -dM -x c -I $incpath/include/uapi $input \
> +       |awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
> +               sub("^#define __NR_", "")
> +               sub("^#define __NR3264_", "")
> +               print | "sort -k2 -n"}' \
>          |create_table
>
> Thanks,
> Tiezhu
>

Hi Tiezhu,

Thanks for your prompt feedback.
It was merely a suggestion entirely subject to your discretion.

If no other patterns are anticipated to be processed by the sub
routines, they may be combined into a single sub routine like so:
awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
        sub("^#define __NR(3264)?_", "")
        print | "sort -k2 -n"
}'
