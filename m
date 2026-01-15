Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2F32693E
	for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509910; cv=pass; b=spwZJCvsnupv6XsFxTLFXaMrndBC/vqqurNefV518TekyHaXGDCYS6eya49mzp1P6Hb3duMwbUalUk5ONl6gcCYIBD/RQN4s9ss088dGUZvNIOVtqNHJziypKHwfHyR4gG5x5poWLUSvz1DUIDBtzlTmsEtGCTX1bjZQFTGzk/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509910; c=relaxed/simple;
	bh=tcBF4nuTdaJWQaR42nPx3uzp8aSI/YG/w0GCulHFaoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eliioluVqJHvlgdrOZ3O3wN3YuFq9BnALIZFM7wEvNBODXi//UBgX8bFSZCFApjWv1yFShzus1Xx0jZF79utf5HapFqDYtlaNPhUjb1I04K9fcX6PPav3K4S1w7Kvuj6pHg+6PVJss9xx+FPvs3MmQe/XfTl+cidq4lEc4vHftc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qt+aUKjK; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qt+aUKjK"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5014e8a42aeso13382191cf.2
        for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 12:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768509908; cv=none;
        d=google.com; s=arc-20240605;
        b=I7akFZl0MYHmQO+QU/g7E77zTWnUd7pzgbIGPFw1SVo8y+7kKH7eOIJPGXHZRSS8iB
         5SmHNID0EJmIi4MlUF6Ld1ruMhnAMbGa5f/QClnJWmpPfFzIX86k9Qn87aF80UN9kF/i
         h9+2BzMjlVQL1H5CLNSscRQo/Iqjcok5jsR8UGa/KVWGnoOZaZkDvAJfqt6Y1+gpsJMe
         Jm6bE+dwUVhZRaqtGscERYYyJXUFwwFEsDNNbBTptqMm3TFZHClTWQ9hSrJh0RTLRqTx
         zjNCwl8VOpByMFjWtFmPXq32/B/Mp3jSuZaG+xj57DQ7W4hzRCyuNoY8zPteVZ/57b50
         szpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9DEwRAP+sPbYYatTSTzERFwiaou/pYxLbvlBBsfRQc=;
        fh=p3io9kbXS6gM4BtYme2DjNBdaFIrVa5KBkAuVAGsORM=;
        b=OIqLZs5yKUZU8bLOVy8a6W3WIdB04qLmXE4ApY8d7nzK6+puptz4wMVtuaPrv9EKOn
         PdpEg+2fFgMOv/KL1TnVvH9+SEPfbttMREwJms85GkEJZ3UVj5vgMwM5ZvJygJ7UtjeL
         1bSa4zKMCBo6Qnm2LD/IhiB3SAHuvX4TikXBCyKZbEx7iIjYCqpcXIdYUlZ2m27gHE6V
         Z18DsZJfS7FZVvsS+Dhwtl1rtlFuES/aT+D2TyaneQxIJ88iIZG/zATyH0PDVwAu5JJZ
         0z3oL0R1mvL80m3gX0nKVQfdkomDIExaqAvE7/vE1BnlVj86yyeSyXC+ha3h7GkNjrcF
         TgdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768509908; x=1769114708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9DEwRAP+sPbYYatTSTzERFwiaou/pYxLbvlBBsfRQc=;
        b=Qt+aUKjKz4ZCF6TX2Yw/+CLsngrexELhhvUXR7braFqrjC8nayQb4R1S5LjsrQWdO3
         kt9S5wekoivtlw11JQNXRFG9CPsMznyBzq+PP6cbvV7wmHVU8ya2jPzW6zPQnOqTxO0o
         xu0W8d53xJiuHL+UxEpXrL/nhUCqku+zwltg807ag0hn4cKRwmDZMkaKGCab2jEY3PbG
         cRoVk4N01VruhQxw+AlrW6KWMFFoS/52BFvI12ZpinQaLSyVNnNaGMBXfara5dW/ST2q
         sM14L0kGEO3j+4fwRo/hHRriBbwFdVlJi8bVCVIPvKB5Oa6dEQO6uNsrfbv8ywdba6TJ
         9wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768509908; x=1769114708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9DEwRAP+sPbYYatTSTzERFwiaou/pYxLbvlBBsfRQc=;
        b=GNwLp0crCLwwbYnPOuBCnCaiedXbputacMab6EroK3T2Hf6t0P1YgW7hwCwhYiCQFk
         R4+PX5MuDZbrL/DcKoR4BhnmQMNuaPO9Vw/6Sg5axVi9v3D5grDqXXX3nrp/eZSTLl/e
         bEG0Ufx0x3o8Rt8U1YJLBUNxgufKAI9r+B7LNz+Muy65pDoT3H5fGYrNzUbcnmARb4Uy
         BkME53vbgv+Nu5mKFm7CFW1a6MZ57VhL5OOCYK/huV50TD1j8jP8Uin7B3JsIjRl1/AZ
         FVKda8M4342WCD+GgRnJBcqCzGrqUK9qcnqM0+9m1aqNr8WPpWwNS6+rHH7CAw+I9rkR
         dczw==
X-Forwarded-Encrypted: i=1; AJvYcCWNLWfKPI8YZOFEKAk7SRenFdnpbNQEeMiPkc59aitgcOSNtGoJHjN9CdugGkF6g2lhZrApQNyf4SQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyp9D6tzKBYBqHAbZsuWo64uVzS4ILMXcOX+3EgeqCmw5Xi1Vr
	UatVqJlQhV/ta7sgLEoGv9fR2kfhU6ItSb5vd3/5KMcVj8aas6Lu7XffRpjBUJce9iMILH1ZmYa
	XbH1U0ozd+MitQc7ldcIxukxI0n27yjo=
X-Gm-Gg: AY/fxX5YQXUkh8cXz2C9iNqnrVniz3KG44Ie3Llj0ZiQrsEyOW8TGxpwTmt8BOWR9vk
	ECT6pbYAfu+yvn7Y531/Z554gCHy0x0EsYnFK8TVsv/OZvoNJiUlPY2/YriVjTUlTFWuHjjXBU3
	FeRWIM8F06bsaYAeJAdDlYGOfsPa0YUM8vMZIzPjJb34emHpRtiYD+0wqbsYcM0CLHakXw8p9V1
	a+W/u15/5vD88cRzVdrIl1rILv8BHDneLO0OLDXEy8e/g7D8drC7Iqu6NgzpfrrNDHW1ks=
X-Received: by 2002:a05:622a:134a:b0:501:4528:27ca with SMTP id
 d75a77b69052e-502a1714fbamr12445591cf.51.1768509908001; Thu, 15 Jan 2026
 12:45:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2yu+XkEMWz6FOHiDEEQw-G_iKG2KHP=F=1CiqLr0mCgNA@mail.gmail.com>
 <d299d7ba-4e9e-5b16-5aa4-898b62330c24@loongson.cn>
In-Reply-To: <d299d7ba-4e9e-5b16-5aa4-898b62330c24@loongson.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 15 Jan 2026 12:44:56 -0800
X-Gm-Features: AZwV_QgjP2j9fiM1bbWupGQo0ZtEscx6nLExKs_juGAOHx-xoENEcocgTyDsmsA
Message-ID: <CAK3+h2yFJDNVPo=38PcYCMNhmw0cQBouL5h7sX0KmyLu-_5zwQ@mail.gmail.com>
Subject: Re: [BUG?]: bpf/selftests: ns_bpf_qdisc libbpf: loading object
 'tc_bpf' from buffer
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: bpf <bpf@vger.kernel.org>, loongarch@lists.linux.dev, ast <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 5:13=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/1/2 =E4=B8=8A=E5=8D=882:26, Vincent Li wrote:
> > Hi,
> >
> > I used AI to enhance my message, hope it helps :)
> >
> > I am reporting test failures observed while running BPF selftests on a
> > LoongArch machine. Both the ns_bpf_qdisc and xdp_synproxy tests
> > exhibit WATCHDOG timeouts and eventual failures. The issue appears
> > architecture-specific but I am not sure.
> >
> > Issue Summary:
> > When building and running 6.19.0-rc3 BPF selftests on a LoongArch machi=
ne:
> >
> > The "ns_bpf_qdisc/attach to mq" test fails with a WATCHDOG timeout
> > after 120 seconds, followed by SIGSEGV.
>
> ...
>
> > Are these two test failures (ns_bpf_qdisc and xdp_synproxy) related,
> > given they both show similar timeout patterns?
> >
> > Environment:
> >
> > Kernel: 6.19.0-rc3
> >
> > Architecture: LoongArch
> >
> > Test Command: ./test_progs -t ns_bpf_qdisc
>
> Tested with the latest 6.19-rc5, the testcase passed on LoongArch.
>
> 1. Here are the test results:
>
> $ sudo ./test_progs -t ns_bpf_qdisc
> Warning: sch_htb: quantum of class 10001 is small. Consider r2q change.
> #219/1   ns_bpf_qdisc/fifo:OK
> #219/2   ns_bpf_qdisc/fq:OK
> #219/3   ns_bpf_qdisc/attach to mq:OK
> #219/4   ns_bpf_qdisc/attach to non root:OK
> #219/5   ns_bpf_qdisc/incompl_ops:OK
> #219     ns_bpf_qdisc:OK
> Summary: 1/5 PASSED, 0 SKIPPED, 0 FAILED
>
> 2. Here are the toolchains:
>
> $ clang --version | head -1
> clang version 21.1.8 (https://github.com/llvm/llvm-project.git
> 2078da43e25a4623cab2d0d60decddf709aaea28)
> $ gcc --version | head -1
> gcc (GCC) 16.0.0 20260105 (experimental)
> $ as --version | head -1
> GNU assembler (GNU Binutils) 2.45.50.20260105
> $ pahole --version
> v1.31
>
> 3. Here are the test steps:
>
> (1) Compile and update kernel
>
> cd linux.git
> make mrproper defconfig -j"$(nproc)"
>
> scripts/config -e FTRACE -e FUNCTION_TRACER -e DYNAMIC_FTRACE \
> -e FTRACE_SYSCALLS -e FPROBE -e BPF_LSM -e DEBUG_ATOMIC_SLEEP \
> -e KPROBES -e FUNCTION_ERROR_INJECTION -e BPF_KPROBE_OVERRIDE \
> -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT -e DEBUG_INFO_BTF \
> -m TEST_BPF -d BPF_UNPRIV_DEFAULT_OFF -d ARCH_STRICT_ALIGN \
> -e NET_SCH_BPF -e NET_SCH_HTB -e DIBS -e DIBS_LO -e SMC \
> -e SMC_HS_CTRL_BPF --set-val RCU_CPU_STALL_TIMEOUT 60
>
> make olddefconfig all -j"$(nproc)"
> sudo make modules_install -j"$(nproc)"
> sudo make install -j"$(nproc)"
> sudo reboot
>
> (2) Compile and test bpf
>
> cd linux.git
> cd tools/testing/selftests/bpf && make
> sudo ./test_progs -t ns_bpf_qdisc
>
> Thanks,
> Tiezhu
>

Here is my toolchain version

[root@fedora gcc]# clang --version
clang version 21.1.5
Target: loongarch64-redhat-linux
Thread model: posix
InstalledDir: /usr/bin

[root@fedora gcc]# pahole --version
v1.31

[root@fedora gcc]# gcc --version
gcc (GCC) 14.2.1 20241104 (Red Hat 14.2.1-6)

[root@fedora gcc]# as --version
GNU assembler version 2.42.50.20240531

I repeated the same steps from above you mentioned with the same
kernel config and ran into the same issue.

I attempted to update gcc by compiling with ./configure
--prefix-/usr/local; make; but ran into problem with

checking for loongarch64-unknown-linux-gnu-gcc...
/usr/src/gcc/host-loongarch64-unknown-linux-gnu/gcc/xgcc
-B/usr/src/gcc/host-loongarch64-unknown-linux-gnu/gcc/
-B/usr/local/loongarch64-unknown-linux-gnu/bin/
-B/usr/local/loongarch64-unknown-linux-gnu/lib/ -isystem
/usr/local/loongarch64-unknown-linux-gnu/include -isystem
/usr/local/loongarch64-unknown-linux-gnu/sys-include -fmultiflags
-fno-checking
checking whether the C compiler works... no
configure: error: in `/usr/src/gcc/loongarch64-unknown-linux-gnu/libgomp':
configure: error: C compiler cannot create executables
See `config.log' for more details.

Do you have proper instructions to compile gcc?

I am not sure if it is toolchain related. The thing that really
bothered me is why the hell tc_bpf is loaded by libbpf for
ns_bpf_qdisc selftests that seems to have nothing to do with the
tc_bpf object, I can't think of anything special in my build machine
that would trigger this. Anyway, thanks for the help!

Vincent
