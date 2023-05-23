Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1840F4A84E
	for <loongarch@lists.linux.dev>; Tue, 23 May 2023 12:31:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so50432435e9.0
        for <loongarch@lists.linux.dev>; Tue, 23 May 2023 05:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684845103; x=1687437103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+XmU9cW6dJqezkxpvVuKdHpfUq+glTTnVbU9jQUiIY=;
        b=BDsW8NKXWqnFAViuFEK3+DwmsJ3XA06LSPv9HjHVs5GKyo1yV/SucJ936S6bNsIhJh
         jTj4G9coN/rwe0OPxC1VlrWDIKgASIOfXqvRpTg6yP4NWUYkOGD9W4oeQpNYfYgutB4e
         nj3tjodWahVPM2ZwAtnq+Nww6bHEbAwBK3vg6OysQWDqMNoDtG37mh6vGzCaH5ZdCAnr
         UIra1foqagU/c/HW8F3S8UplRlbt91wPrgvKSbB6t5XKeTVtae9Yscrd+YXyb88dzuXe
         johacs49XetzbV6WqEcwrprsN9kXEFVP51o5EN967GFxi+EHmn1AulV9lc7dyc1Fv1XP
         InUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684845103; x=1687437103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+XmU9cW6dJqezkxpvVuKdHpfUq+glTTnVbU9jQUiIY=;
        b=GMjE3OyvtiK74iE2rswlbt9wlkyAGlkfLm2MybsgxhOAaOgNEPJS5fBnt9C4rAYjXH
         Mwk444RRN3niZQQslHwXJM3z7G5T2OcuvM5Zed/4X7eH4+S82VA4Etw0CyTboqBhRPtz
         2KoPXdUnwqmkq0aXazhiPBvdkM3umNPQ1AA/BmtyR0TSG+NrmNhZQT3wddIyUcdylHsh
         2e/zGy8WyvXZXkTPfAQ3MN1QrNO6RkwolGBvHniuII60V0fiG89ffCae+Ovw6rjAtXZl
         CSDCbhQlw1PHwvL176Ccm8NnXzr6oqFcAJECtDkKlDa2kF10upWoi6RZ8zOpvCM+H9lG
         080g==
X-Gm-Message-State: AC+VfDzoABttqXuaZbTDewlDPQaP1Zelu6IM60sOfp2PTIpNKW4slQv5
	MlZTzoOZXaxfAm4Gw2RoNcJOu8VhWmUznbS6cms=
X-Google-Smtp-Source: ACHHUZ7eyHVelDYqGRcyV5GEaa5qgxyRZz2b4R38sbUlVVncJAHgy5N45wc0X6Zmj95p6Lf77UFhSQw+36FXBfxCi9M=
X-Received: by 2002:a05:600c:259:b0:3f4:f0c2:125 with SMTP id
 25-20020a05600c025900b003f4f0c20125mr9235031wmj.23.1684845102963; Tue, 23 May
 2023 05:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1684837327-18203-1-git-send-email-yangtiezhu@loongson.cn> <1684837327-18203-2-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1684837327-18203-2-git-send-email-yangtiezhu@loongson.cn>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Tue, 23 May 2023 15:31:06 +0300
Message-ID: <CAJ1xhMUZoO66b=LNVnjBN1GbHvXdo2b2y+YeONC36Ok=Xn5XFg@mail.gmail.com>
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

On Tue, May 23, 2023 at 1:22=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> After commit 9854e7ad35fe ("perf arm64: Simplify mksyscalltbl"),
> in the generated syscall table file syscalls.c, there exist some
> __NR3264_ prefixed syscall numbers such as [__NR3264_ftruncate],
> it looks like not so good, just do some small filter operations
> to handle __NR3264_ prefixed syscall number as a digital number.
>
> Without this patch:
>
>   [__NR3264_ftruncate] =3D "ftruncate",
>
> With this patch:
>
>   [46] =3D "ftruncate",
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl b/tools/pe=
rf/arch/arm64/entry/syscalls/mksyscalltbl
> index 22cdf91..59ab7939 100755
> --- a/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
> +++ b/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
> @@ -39,7 +39,8 @@ create_table()
>         echo "};"
>  }
>
> -$gcc -E -dM -x c -I $incpath/include/uapi $input \
> -       |sed -ne 's/^#define __NR_//p' \
> -       |sort -t' ' -k2 -n             \
> +$gcc -E -dM -x c -I $incpath/include/uapi $input               \
> +       |awk '{if ($2~"__NR" && $3 !~"__NR3264_") {print}}'     \
> +       |sed -ne 's/^#define __NR_//p;s/^#define __NR3264_//p'  \
> +       |sort -t' ' -k2 -n                                      \
>         |create_table
> --
> 2.1.0
>

As an aside, the awk + sed + sort parts of the command line may be
reduced to the following awk script, if desired:
awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
        sub("^#define __NR_", "")
        sub("^#define __NR3264_", "")
        print | "sort -k2 -n"
}'
