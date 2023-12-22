Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC1210E5
	for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4wqB2Iu"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-20458cf9e5aso28650fac.0
        for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703255527; x=1703860327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MRirUTen9Qb/bHuifbqECgBAdAb7f7ac9lAwQG0yf8=;
        b=K4wqB2IubfYGfK0KEo8kFPEVPvKKzoERt8wEX6ANm/Cv1Q/9151SHNXhrQTVeO02rn
         beMc5kAEuIiQKqDWhjL+N3SBJl3j3KC+7kame8QxaZCgW6SnBTVZLvFKjE0Cq6aXUy7b
         8nbyKTn7/bxpq59+ROgd9NsuV+V6BLLb+KBikCb8ZuR6dEwtrdiJiA+S2Wagy+OPV3ox
         BsNHdaDogAP3s/vTxz250L1HT4kxb4ruFZsI5JSjbt25t5z5AackvNB/QtXiRTpDwPW2
         sWVYTlt2sl78uvQK+CdpQEPbeNkxqSGed2+yPxjNSTknYBF8zyVhCV5fKD84ftfShaQE
         tYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703255527; x=1703860327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MRirUTen9Qb/bHuifbqECgBAdAb7f7ac9lAwQG0yf8=;
        b=i/PuI2i/M/lHnFM7JcT9IG0J1he8gbhGWbzHSeU7kIQ3QbcZjieII3sWSnOstmWCJ1
         QwHlIDpi4V1nJR9Me/JGtPv2zuWRQgUGOKgB2PcQAhM4YYZ/qxjYS6cYWkxEFWxQnR07
         S7WMIvYBoKuNxh3Mc7URNoAuLpugwe4X7/rNi3r3BGkqQ8oHXrN7+rWgKIQ9y3Z+E1NA
         GvxoHrcOtUC7luZmhmS/+6xVrEWWd+HQcNF4CjBHFnuUHqa2v8XEa2qB+DXYfQ6g8gtk
         XtymJKoItcjksUndhGwdMfaOPZAFMG7MnSmBczlhflVR2EuvgCHXQzXruazZB97dzHRM
         Oe/Q==
X-Gm-Message-State: AOJu0Yx9OLGS87XVKcn5At52uJTDXaf1Rk5PTHOEjYoDM395b3Y956FM
	eFRykz9aOgvNThSUQIcDhi4AD/QWI/M+VJcvmgscAi5BjeU=
X-Google-Smtp-Source: AGHT+IFWgHL1+n83K7D73D+FHb2oPNhjYh3lmIJAg+Yk+Kxe2QihmzUANm+/nRRzNanekpCiRHJlZVLf/kEuDXdnCUM=
X-Received: by 2002:a05:6870:b6a3:b0:204:fca:ce23 with SMTP id
 cy35-20020a056870b6a300b002040fcace23mr1706302oab.28.1703255526859; Fri, 22
 Dec 2023 06:32:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231215142138.3281-1-hengqi.chen@gmail.com> <14161bfc-c561-f93b-a219-a31583a679fc@loongson.cn>
In-Reply-To: <14161bfc-c561-f93b-a219-a31583a679fc@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Fri, 22 Dec 2023 22:31:56 +0800
Message-ID: <CAEyhmHRBuF-SqwYiYEtdujLU23HZqfB24hsddBOL42ZEm8oQRg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Support 64-bit pointers to kfuncs
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, chenhuacai@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 9:42=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Hi Hengqi,
>
> Thanks for the patch, sorry for the late reply.
>
> On 12/15/2023 10:21 PM, Hengqi Chen wrote:
> > Like commit 1cf3bfc60f98 ("bpf: Support 64-bit pointers to kfuncs")
> > for s390x, add support for 64-bit pointers to kfuncs for LoongArch.
> > Since the infrastructure is already implemented in BPF core, the only
> > thing need to be done is to override bpf_jit_supports_far_kfunc_call().
> >
> > Before this change, several test_verifier tests failed:
> >
> >   # ./test_verifier | grep # | grep FAIL
>
> [root@linux bpf]# ./test_verifier | grep # | grep FAIL
> Usage: grep [OPTION]... PATTERNS [FILE]...
> Try 'grep --help' for more information.
>
> It should be:
> [root@linux bpf]# ./test_verifier | grep "#" | grep FAIL
>
> >   #119/p calls: invalid kfunc call: ptr_to_mem to struct with non-scala=
r FAIL
> >   #120/p calls: invalid kfunc call: ptr_to_mem to struct with nesting d=
epth > 4 FAIL
> >   #121/p calls: invalid kfunc call: ptr_to_mem to struct with FAM FAIL
> >   #122/p calls: invalid kfunc call: reg->type !=3D PTR_TO_CTX FAIL
> >   #123/p calls: invalid kfunc call: void * not allowed in func proto wi=
thout mem size arg FAIL
> >   #124/p calls: trigger reg2btf_ids[reg->type] for reg->type > __BPF_RE=
G_TYPE_MAX FAIL
> >   #125/p calls: invalid kfunc call: reg->off must be zero when passed t=
o release kfunc FAIL
> >   #126/p calls: invalid kfunc call: don't match first member type when =
passed to release kfunc FAIL
> >   #127/p calls: invalid kfunc call: PTR_TO_BTF_ID with negative offset =
FAIL
> >   #128/p calls: invalid kfunc call: PTR_TO_BTF_ID with variable offset =
FAIL
> >   #129/p calls: invalid kfunc call: referenced arg needs refcounted PTR=
_TO_BTF_ID FAIL
> >   #130/p calls: valid kfunc call: referenced arg needs refcounted PTR_T=
O_BTF_ID FAIL
> >   #486/p map_kptr: ref: reference state created and released on xchg FA=
IL
> >
> > This is because the kfuncs in the loaded module are far away from
> > __bpf_call_base:
> >
> >   ffff800002009440 t bpf_kfunc_call_test_fail1    [bpf_testmod]
> >   9000000002e128d8 T __bpf_call_base
> >
> > The offset relative to __bpf_call_base does NOT fit in s32, which break=
s
> > the assumption in BPF core. Enable bpf_jit_supports_far_kfunc_call() li=
fts
> > this limit.
> >
> > With this change, the test_verifier tests now all passed:
> >
> >   # ./test_verifier
> >   ...
> >   Summary: 777 PASSED, 0 SKIPPED, 0 FAILED
>
> I met build errors and failed/skipped tests at the beginning, so I spent
> some time to analysis the problems. In order to achieve success, it is
> necessary to do the following steps:
>
> (1) build with loongson3_defconfig and also set
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> CONFIG_DEBUG_INFO_BTF=3Dy
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_BPF_LSM=3Dy
>
> (2) enable bpf jit and enable unprivileged bpf before test
> echo 1 > /proc/sys/net/core/bpf_jit_enable
> echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled
>
> Otherwise there exist build errors when execute
>
>    make headers && cd tools/testing/selftests/bpf && make -j4
>
> Furthermore, there exist failed test "#507/p sleepable lsm accept FAIL"
> and many skipped tests when execute "./test_verifier".
>
> I think it would be best to add the above info in the commit message so
> that the users know how to test and how to solve or avoid the failures.
>
> >
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
>
> Feel free to add a
>
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> Thanks,
> Tiezhu
>

Thanks, will send a v2 soon.
