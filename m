Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABBB19BAE
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 17:29:11 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-57012b2973eso69952627b3.2
        for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 10:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687368550; x=1689960550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHKJ5E4QyaneB9JDT8DwEZgyuTNCEA7MDDSg1wRoMEI=;
        b=l2UUIYBP3EWboTAL6cBlwuipVOkgwyVhN3+owxjdWDZB7ryamLMkE3Dk4t9oK5Snbm
         N0kE9pw38LiKWwzrOMV6IdItQmOjWaWguQR7KXOheApFfm+SjEIc1SqqUojqILMa7Eja
         ac1eBXivytMjZf5iqRlJzJv7LSQGmX1T0Jotb4hhwjUBNlb8p92mluJEt+oDb7Ajfp9l
         iLEjps3dSuqJShpjLnkwGDuiZhobtrPh/HNWA/bKJSenpERXzOlvjoc0H2bMZ/KuMZVC
         Q8OFQ3cbCP+HtmuwOGdg+honFJIUgO8UrNqpundg/bBOkE5Ze5eQVOniasNVbggeUHOd
         Ul1Q==
X-Gm-Message-State: AC+VfDyzEQzvB0bB0/B9TxPf66ax8ByuFVcyPKMJRSDj0YpO+56POQST
	D12m1jKxjiC3xyPzM5cwYnPhj55Zf8ZKO8MsDCM=
X-Google-Smtp-Source: ACHHUZ7hMGvTxVYM7j06iuh48J3sQevUoI3xiFZJa4qO0+XgMX1X2u/VYFsp7hO0BhArpajGcDMuvE2Xa8xasyBdtao=
X-Received: by 2002:a25:b1a3:0:b0:bca:531d:dcde with SMTP id
 h35-20020a25b1a3000000b00bca531ddcdemr11934138ybj.30.1687368550410; Wed, 21
 Jun 2023 10:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230620132025.105563-1-wangrui@loongson.cn>
In-Reply-To: <20230620132025.105563-1-wangrui@loongson.cn>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 21 Jun 2023 10:28:59 -0700
Message-ID: <CAM9d7cgpm+Uz4JOh9vW60OQkCOjpbNvrrDy-KefALVak1EXQxQ@mail.gmail.com>
Subject: Re: [PATCH] perf annotate: Fix instruction association and parsing
 for LoongArch
To: WANG Rui <wangrui@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 6:21=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> In the perf annotate view for LoongArch, there is no arrowed line
> pointing to the target from the branch instruction. This issue is
> caused by incorrect instruction association and parsing.
>
> $ perf record alloc-6276705c94ad1398 # rust benchmark
> $ perf report
>
>   0.28 =E2=94=82       ori        $a1, $zero, 0x63
>        =E2=94=82       move       $a2, $zero
>  10.55 =E2=94=82       addi.d     $a3, $a2, 1(0x1)
>        =E2=94=82       sltu       $a4, $a3, $s7
>   9.53 =E2=94=82       masknez    $a4, $s7, $a4
>        =E2=94=82       sub.d      $a3, $a3, $a4
>  12.12 =E2=94=82       st.d       $a1, $fp, 24(0x18)
>        =E2=94=82       st.d       $a3, $fp, 16(0x10)
>  16.29 =E2=94=82       slli.d     $a2, $a2, 0x2
>        =E2=94=82       ldx.w      $a2, $s8, $a2
>  12.77 =E2=94=82       st.w       $a2, $sp, 724(0x2d4)
>        =E2=94=82       st.w       $s0, $sp, 720(0x2d0)
>   7.03 =E2=94=82       addi.d     $a2, $sp, 720(0x2d0)
>        =E2=94=82       addi.d     $a1, $a1, -1(0xfff)
>  12.03 =E2=94=82       move       $a2, $a3
>        =E2=94=82     =E2=86=92 bne        $a1, $s3, -52(0x3ffcc)  # 82ce8=
 <test::bench::Bencher::iter+0x3f4>
>   2.50 =E2=94=82       addi.d     $a0, $a0, 1(0x1)
>
> This patch fixes instruction association issues, such as associating
> branch instructions with jump_ops instead of call_ops, and corrects
> false instruction matches. It also implements branch instruction parsing
> specifically for LoongArch. With this patch, we will be able to see the
> arrowed line.
>
>   0.79 =E2=94=823ec:   ori        $a1, $zero, 0x63
>        =E2=94=82       move       $a2, $zero
>  10.32 =E2=94=823f4:=E2=94=8C=E2=94=80=E2=86=92addi.d     $a3, $a2, 1(0x1=
)
>        =E2=94=82    =E2=94=82  sltu       $a4, $a3, $s7
>  10.44 =E2=94=82    =E2=94=82  masknez    $a4, $s7, $a4
>        =E2=94=82    =E2=94=82  sub.d      $a3, $a3, $a4
>  14.17 =E2=94=82    =E2=94=82  st.d       $a1, $fp, 24(0x18)
>        =E2=94=82    =E2=94=82  st.d       $a3, $fp, 16(0x10)
>  13.15 =E2=94=82    =E2=94=82  slli.d     $a2, $a2, 0x2
>        =E2=94=82    =E2=94=82  ldx.w      $a2, $s8, $a2
>  11.00 =E2=94=82    =E2=94=82  st.w       $a2, $sp, 724(0x2d4)
>        =E2=94=82    =E2=94=82  st.w       $s0, $sp, 720(0x2d0)
>   8.00 =E2=94=82    =E2=94=82  addi.d     $a2, $sp, 720(0x2d0)
>        =E2=94=82    =E2=94=82  addi.d     $a1, $a1, -1(0xfff)
>  11.99 =E2=94=82    =E2=94=82  move       $a2, $a3
>        =E2=94=82    =E2=94=94=E2=94=80=E2=94=80bne        $a1, $s3, 3f4
>   3.17 =E2=94=82       addi.d     $a0, $a0, 1(0x1)
>
> Signed-off-by: WANG Rui <wangrui@loongson.cn>

Applied to perf-tools-next, thanks!
