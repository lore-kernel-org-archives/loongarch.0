Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E48D263
	for <loongarch@lists.linux.dev>; Tue,  5 Dec 2023 05:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLmBBRK4"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6d9ae075e5fso418926a34.0
        for <loongarch@lists.linux.dev>; Mon, 04 Dec 2023 21:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701753770; x=1702358570; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3H7gq8msCKMbGxlBjwQWNEiuquIT9/i9gHhunqk9tM=;
        b=LLmBBRK43Bk4uuZKZykFt70Q/xZCN/P6N31L3e/xXNEtQO7cafovtR86KplP+1tIBH
         eZHTwqdqwPGuuRuE4UZZevIRuRJebfseM6UsePAxstkZQoWuWe8JoGdUK9VHENKaDchg
         50dFeRDsX0VCiND1COaRB+zEVTpBZZXr09yQke6mGAQ9OIqUz5fYkJw7amuQ4gxvUFo+
         BpCJMIYhRrZT2APYJ33kfKYaxdLIEBdmcGWmeVUJxwqH2zyzfbDlQsnN/hyJs+GQXXMY
         REejPNJPRIsXhqc1vb+ub3kn1ey37Mfeks9hA2pQN4bX9ot4vQs4g27cWcN3Fi96BzLA
         6hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701753770; x=1702358570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3H7gq8msCKMbGxlBjwQWNEiuquIT9/i9gHhunqk9tM=;
        b=GYJHVmj5Br9wpwiBV27xZYOI+vTEJKSnFQMYezr0OwYQgE+FHc4LMcb2GdJSrAVrcc
         N+6ybiie4TEYUd4hIHLjgi/3Y4n0emQfIjaFRQfcrn1JKZ5znKHaFR0tmlcYhx389ytn
         v9Bqk0oDl64jLrkG2gQMjcdaFv1Wk7Qr6dp6X+ZC4JcB0rtwIBE8aCWTwkd0IV/OzSGf
         LwGEVYJy/hrQOSCWk0X9Q6lZLNGLpNatRPj+kBA7Zt0JTwaWwvJ9iqmTIGZcchu6KkZm
         hbS5POmshQ9Lz/TzOT+OjUj8D9mf4Q5SqDXz9KjKwwoDhYIEu91b05LFwm0hkGKl43F6
         TfHg==
X-Gm-Message-State: AOJu0YxkuPSaCH27w8c4I5C33+Wz+NFpvC0v/yxwDathhy+tNcrpc1TW
	s01xj2dn4dhR+zStrNxnP87X7D7W6O8qXi65AxfznnCCcfeoDw==
X-Google-Smtp-Source: AGHT+IGE7EXCYwwAMdLBb71mg2DiwSTWAi2Zugyg9ouDAggHJ3PCXcwvoTAaOgxvWBjCISZ6YXGkyNgWu5295YXLF7Y=
X-Received: by 2002:a05:6870:b14d:b0:1fb:788:e8a3 with SMTP id
 a13-20020a056870b14d00b001fb0788e8a3mr430438oal.30.1701753770291; Mon, 04 Dec
 2023 21:22:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204141938.7230-1-hengqi.chen@gmail.com> <846ccd59-9789-daf1-972d-2a47912f5433@loongson.cn>
In-Reply-To: <846ccd59-9789-daf1-972d-2a47912f5433@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 5 Dec 2023 13:22:39 +0800
Message-ID: <CAEyhmHS=EoK+YHTkJt_dxCRrPcX4SH=rV9vYyoBUdsGsCg3Diw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Remove fatal signed-extension instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, chenhuacai@kernel.org, kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 10:53=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Hi Hengqi,
>
> On 12/04/2023 10:19 PM, Hengqi Chen wrote:
> > As reported on mailing list ([0]), several BPF testcases could
> > triggered kernel panics like:
> >
> >     # ./test_progs -t verifier_map_ptr_mixing
>
> ...
>
> >     [   47.872612] ---[ end Kernel panic - not syncing: Fatal exception=
 in interrupt ]---
>
> According to the commit message, the code itself looks good to me,
> thanks for your patch.
>
> In my opinion, I think it is better to update the commit message
> and split the changes into two separate patches.
>
> > Take the `cls_redirect` case as an example:
> >
> >     cls_redirect()
> >       -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480
> >
> > The pointer is later signed-extended to 0xfffffffffc00b480 at
> > `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
> > page fault and a kernel panic.
>
> The test case that cause panic is "verifier_map_ptr_mixing",
> but here the example is another test case "test_cls_redirect",
> please take "verifier_map_ptr_mixing" as an example to analysis
> to keep it consistent.
>
> >
> > The `cgrp_ls_tp_btf` test reveals another kind of kernel panic
> > when handling memory load:
> >
> >     ptr =3D bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
> >                                  BPF_LOCAL_STORAGE_GET_F_CREATE);
> >
> > The expression `task->cgroups->dfl_cgrp` involves two memory load.
> > Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
> > to perform memory load. But the ldd and ldptrd instructions both
> > have the side effect that it will signed-extended the imm operand.
>
> The initial aim of ldd and ldptrd is to reduce one instruction,
> if it has problem, we can use ldxd directly, but ...
>
> > Finally, we got the wrong addresses and result in kernel panics.
>
> ... if the test case "cgrp_ls_tp_btf" triggers another panic,
> and the cause is another reason related with BPF_DW case,
> please submit a separate patch so that we can record the cause
> and analysis clearly.
>
> >
> > Let's get rid of those fatal signed-extension instrutions to fix
> > the issues. For the first case, no arches do a sext on function
> > return, the fix should be safe. For the second case, we fallback
> > to use a generic ldxd instruction.
>
> Thanks,
> Tiezhu
>

OK, will split this up and add a cover letter.
(I was too lazy and hesitant about making it a patch series.)
