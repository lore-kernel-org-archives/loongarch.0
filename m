Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D319924
	for <loongarch@lists.linux.dev>; Tue, 30 May 2023 19:03:42 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3f804665702so41661cf.0
        for <loongarch@lists.linux.dev>; Tue, 30 May 2023 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685473421; x=1688065421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wg+eakYRQJkWFsR8VKHGbMsmZUbdUsVveMbi9l3IrU=;
        b=3BmQfsxcutfEPmqGYcWZ6a1Z5O/lPh3rsVadxX5KMEHUjcanhGptNKJnGxEYxA80Pr
         2ZP7LNROMrce7azCSMf2CZ6VOYrWdF1RepVCJBvUM/XqXsCYE/iGEvXSw1iscTlQLHDy
         U6AWSOx0qz/RDoEbz3PDPZrrZ16/cArEZDOmC+QkNBFDC2O/n/8K4E70uW8KTDIqi817
         FYURPHLzGtiDCCgHuHASq6MLJLq6VoYmte0kJ4QGj9YbtLMk+HGk9QjTb2UdHT5X3U8k
         951Ivghweq5RhxWVyD7RHbRH6F4Mq3idiqIR92BMZQJOkCzkdAuPMPRJagF3dTBwxaMr
         hbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685473421; x=1688065421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wg+eakYRQJkWFsR8VKHGbMsmZUbdUsVveMbi9l3IrU=;
        b=RtRg9JpMTvkVbUKWDOPDUkPWNu1Ygdko6vI6DYXmeUD8H0f8ei47qxsIbUGM9ymJLQ
         /mCKVRNwObrwr8KGGPTG9S3BfUHnOXXlt/sXJJmzEm+zJgi+t3oWH1miU+eDVgCL/o3Z
         GCPA7DENoJ5Cg7aEJ7EbK9I0jWUjxZi2qxzioGVsm5k1pU96NSwpz064D4RL38Lz7o04
         DoqkHuIBlxalFA7XgD2P+oR9gs8kC9iqa269QPvrH5lREZ32XjSUJ9As//77Rs345ep2
         yUlb5+gLkQ9LMU4XV336zcwUOKDDTSK7dhZO/QhrZlGA/zKDn/8qMzvTd2oiGdfGzDb/
         fPqw==
X-Gm-Message-State: AC+VfDwvsbMe/Zh8+4Sf44OSUYUa0e5ym+dbBMOoRL3hjS96TAdZRB7C
	n1XUfuksvfBSdkCuMM43ccTp/JB/S04dOtfhJBbDmg==
X-Google-Smtp-Source: ACHHUZ4tQx7CHfFMGAthsUJbOk3tJkETYESkIEu6PzSgqVUmKF4lp6c4aKVS3iVEhQx3+aj/GpFZwh3LLrvIT/yC8HY=
X-Received: by 2002:a05:622a:1a01:b0:3f8:3065:7fc5 with SMTP id
 f1-20020a05622a1a0100b003f830657fc5mr234549qtb.1.1685473421607; Tue, 30 May
 2023 12:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
From: Ian Rogers <irogers@google.com>
Date: Tue, 30 May 2023 12:03:30 -0700
Message-ID: <CAP-5=fXvN1b+_krmFSL2=C31WZ3zKafnq=Bqw3ruBKFNzG_8Kw@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/5] perf tools: Modify mksyscalltbl
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 3:10=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> I'm sorry, somehow the patchset didn't reach mailing lists.
> Resending with a fewer people in the cc list, which probably
> was the reason.
>
> Thanks Alexander, Leo and Ian for your reviews and suggestions.

Thanks for the consts!

Acked-by: Ian Rogers <irogers@google.com>

> v3:
>   -- Add a new patch to declare syscalltbl_*[] as const for all archs,
>      suggested by Ian.
>   -- Add a new patch to use max_nr to define SYSCALLTBL_ARM64_MAX_ID.
>
> v2:
>   -- Add a new patch to rename create_table_from_c()
>      to create_sc_table(), suggested by Leo.
>   -- Simplify the shell script, suggested by Alexander.
>
> Tiezhu Yang (5):
>   perf tools: Declare syscalltbl_*[] as const for all archs
>   perf arm64: Rename create_table_from_c() to create_sc_table()
>   perf arm64: Handle __NR3264_ prefixed syscall number
>   perf arm64: Use max_nr to define SYSCALLTBL_ARM64_MAX_ID
>   perf LoongArch: Simplify mksyscalltbl
>
>  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  | 17 ++++-----
>  .../arch/loongarch/entry/syscalls/mksyscalltbl     | 40 +++++++---------=
------
>  tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  2 +-
>  .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  2 +-
>  tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  2 +-
>  tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  2 +-
>  tools/perf/util/syscalltbl.c                       | 14 ++++----
>  7 files changed, 32 insertions(+), 47 deletions(-)
>
> --
> 2.1.0
>
