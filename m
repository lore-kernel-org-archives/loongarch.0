Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D209615C158
	for <loongarch@lists.linux.dev>; Sat,  2 Aug 2025 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754149974; cv=none; b=A5jXD6EDvCgAYWRDkLf4f54qv2x5q6VTciuYZZBJGJc0yeVYXvLmQ5eDAYZxQeatTmvMtBZbAdkl0bw7ip9gKrubdZIu4j0XEWZbwCjRsF1LKKeXpjaqRZkKlIaC2PzuRTqZh2GVbFwmF+JfGf/BAi+Zc2KJmCP/af3iz0bl9W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754149974; c=relaxed/simple;
	bh=XtOqyzskR/5frMXLbsmbGfnppZsaUyXHTbTlvRG+1BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7lEfjahRJ33dTbRU4Mm8yPrFgcDB6tzQJxGvPJZQ2kTxI0xrgsnLr/UH0mUhN/K4+fi/cu7MoEFc51a6S5i6MBdq2zc6DSjaqD42nq7bVK8C8dS3Y0kLs5xYCKBUi9KO0cJL5wguGpsKeqUepSHo+FiLg8VJQej6n54sNG56h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RS13hSc5; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RS13hSc5"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4aeb2edce3dso16484661cf.2
        for <loongarch@lists.linux.dev>; Sat, 02 Aug 2025 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754149972; x=1754754772; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ir76EQ98zrUs/ZpboSMlnzTx8YG/Ro+0cD4T//5tH0=;
        b=RS13hSc5gF1M+v/kXjmW/nlYJQ5X15mimf2ovXtSx1ChHD5Ode8wCtVR7jUxJ3/G1J
         U2qUHC8jOysaBMR+IqFPH+D8o/jqLeC+feW49dYApwheqrQLP+15qKMxI4kgj9kZgu7G
         vv16aK4FNmIalNNNUsO8doLJ3tjeqB0QzuraGW69XCK0+EiKinBAgnIz8F2Hzuhn+XU7
         g2al5aBdyYHMWpylHgWEE2+6GWC2wbvV65p0hZ2i70Qf4IKkW9+itFCxyhkLiMK8rdtd
         tBAqU4ABdaX+KC1Vkpg6eRZoHV4yuhj0PeIpAIg8aORufGwWLb9w8WySurwmkfaZbZCV
         VTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754149972; x=1754754772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ir76EQ98zrUs/ZpboSMlnzTx8YG/Ro+0cD4T//5tH0=;
        b=l9Owjw3fV+2QvGcGYFwEZ9GITwg1+KBP34sG8M8VUsxWCib4HtqyRZznInZUzd3AyW
         w+pZMXkygzFxisxWNRKt/CVkvzl0Lk7AIRXzx047dICb0m3NdnJ+0XfqJm3lfLKhlhd6
         Mtk2VWwLH/PsiTMDYgs6UkZC8bxidaaeza687PbG2hai8PSLuFNr587jtviIKwzgVjPW
         wXa4vffEFC3Ge1NtvVhUSC6j7ES/a33SgpU4yHQTMmN3S7c4WuJW12J5+yKCptFLZx+h
         3x8PX+1RYnfot+PDoXc2t0nYbXhvdyPGMX2IAQFu34a4wQZCpee5otXXnkuZfmo8VkHX
         w6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUJRYRgSC/Ywfbc/9mhcukJrz21SSQTdX1gFqg0iq4rrf8TX+Zxg1skzC+V+UplCInziQ5rC0rViBg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm6rEUHg1zKq5U+u8iRGi0J1usZa+6iPPlH4MTNnlzEgkKF+4A
	CLrJDWBBbX5GGHBY8rq/8QSF+Zr1cycVr6jROLLWf6kaIzX+jxCHpLOGkPaz4gMVfs6H6ELW/kk
	eDxzZapWZMOHoRBjKNaMWYq86SkgPcXk=
X-Gm-Gg: ASbGncvPFhx8/2EZT5rdRQjH/8G9NvcHPaE+wl/pwt1GypU2KiNfOf2mtj+fg0TxblK
	n5/e5BlxyLHZ5s1o3ZBA/ab2052t2ky7oPxcutRWitS2HcmMN+D2bPqnj3Lf5ZIZGI5d6kMqIwH
	EZzNhwVcmoN3/SuGz2OCQIyduFesEOPlaU72wWrxtVL5TsGRMtGee5Wnud+qcnG7gqvxGU+v/GL
	LtRgWQ=
X-Google-Smtp-Source: AGHT+IEI0bzNfHRu8mV8kq3Y4Vn8Y8yIZlu39XYlxgKpFnaOfBvjKEjnsjP+qCZYo0WZempyx4J7mwrsx9APzn2QGio=
X-Received: by 2002:a05:622a:28e:b0:4ab:6c5a:1fd2 with SMTP id
 d75a77b69052e-4af10a4a5f2mr51428871cf.29.1754149971474; Sat, 02 Aug 2025
 08:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn>
 <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
 <84789726-18a6-b46f-3ece-f887599ccf4a@loongson.cn> <CAK3+h2x4MWR677UPTdAGX8jUg7EC_iweCKh8S1FMWSVVVsO8oA@mail.gmail.com>
 <CAK3+h2y-7h=D5NaO=v8u7HaoHQ+MdhAvsH4drpZxypbr+ABodg@mail.gmail.com>
In-Reply-To: <CAK3+h2y-7h=D5NaO=v8u7HaoHQ+MdhAvsH4drpZxypbr+ABodg@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sat, 2 Aug 2025 08:52:40 -0700
X-Gm-Features: Ac12FXw31mNe5mObl7D1QsqJj3Hc1wclYcTYn0H81hV9x3-QbAyRzY38uC5SL-o
Message-ID: <CAK3+h2zFRQNcjf_B+4yORbGp85bXAUSGX-VWt3kR1ZJomkhtHQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Chenghao Duan <duanchenghao@kylinos.cn>, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 7:47=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> On Sat, Aug 2, 2025 at 6:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson=
.cn> wrote:
> > >
> > > On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > > > Hi Chenghao,
> > > >
> > > > I trimmed the email recipients only to the loongarch mailing list a=
nd
> > > > folks who might pay attention to this, I personally don't like to
> > > > bother other people who may not be interested in this :). Folks let=
 me
> > > > know if this  is not ok. anyway, please check my bpf selftest resul=
t
> > > > inline.  The fentry_attach_stress results in kernel lockup.
> > >
> > > It passed on my test environment.
> > >
> > >    $ sudo ./test_progs -a fentry_attach_stress
> > >    #104     fentry_attach_stress:OK
> > >    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > >
> > > I used loongson3_defconfig and the following additional configs:
> > >
> > > CONFIG_KPROBES=3Dy
> > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > > CONFIG_TEST_BPF=3Dm
> > > CONFIG_FTRACE=3Dy
> > > CONFIG_FUNCTION_TRACER=3Dy
> > > CONFIG_DYNAMIC_FTRACE=3Dy
> > > CONFIG_FPROBE=3Dy
> > > CONFIG_FTRACE_SYSCALLS=3Dy
> > > CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> > > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > > CONFIG_DEBUG_INFO_BTF=3Dy
> > > CONFIG_NET_SCH_BPF=3Dy
> > > CONFIG_BPF_LSM=3Dy
> > > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > > CONFIG_ARCH_STRICT_ALIGN=3Dn
> > >
> > > I am not sure whether it is related with configs, you can test it aga=
in.
> > >
>
> I did:
>   cp arch/loongarch/configs/loongson3_defconfig .config
>   ./scripts/kconfig/merge_config.sh -y .config config-tiezhu(your above c=
onfig)
> indeed I could not reproduce the lockup, even run the test in a loop.
> it seems to be related to the kernel config I use, maybe you could try
> my kernel config?
>
> [root@fedora bpf]# while true; do ./test_progs -a
> fentry_attach_stress; sleep 1; done
> #105     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> #105     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>
> #105     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> #105     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> #105     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> #105     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> #105     fentry_attach_stress:OK
>

while checking dmesg with your nolockup config, I see following log:

[ 3469.410821] Hardware name: Loongson
Loongson-3A6000-7A2000-NUC/Loongson-3A6000-7A2000-NUC, BIOS
Loongson-UDK2018-V4.0.05759-stable202405 07/12/24 15:49:14
[ 3469.410824] pc 90000002456d4880 ra 90000000060885f4 tp
90000002975d8000 sp 90000002975dbc10
[ 3469.410826] a0 0000000000000000 a1 ffff8000128f0048 a2
00007ffff1c02638 a3 0000000000000000
[ 3469.410828] a4 00007ffff1c02680 a5 00007ffff0ce0f20 a6
00007ffff0ce0f20 a7 0000000000000118
[ 3469.410830] t0 ffff80000338dd44 t1 90000002456d4880 t2
d665bdcea9f14eb9 t3 90000001dc9c1000
[ 3469.410832] t4 90000001dea99670 t5 0000000000000000 t6
0000000000000000 t7 0000000000000000
[ 3469.410834] t8 000000000000000f u0 000000000000000a s9
90000002975dbec0 s0 90000002975dbc70
[ 3469.410836] s1 0000000000000000 s2 90000000076a5000 s3
0000000000000000 s4 ffff8000128f0000
[ 3469.410838] s5 0000000000000000 s6 0000000000000000 s7
0000000000000050 s8 fffffffffffffdf4
[ 3469.410840]    ra: 90000000060885f4 __bpf_prog_test_run_raw_tp+0x6c/0x10=
8
[ 3469.410848]   ERA: 90000002456d4880 0x90000002456d4880
[ 3469.410851]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
[ 3469.410860]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[ 3469.410865]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
[ 3469.410870]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
[ 3469.410875] ESTAT: 000d0000 [INE] (IS=3D ECode=3D13 EsubCode=3D0)
[ 3469.410878]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000)
[ 3469.410880] Modules linked in: bpf_testmod(O) tls nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink cmac
algif_hash algif_skcipher af_alg bnep vfat fat rtw88_8821ce
rtw88_8821c rtw88_pci rtw88_core mac80211 btusb libarc4 btrtl btbcm
btmtk btintel cfg80211 bluetooth sha3_generic kvm jitterentropy_rng
drbg ecdh_generic ecc loongson3_cpufreq spi_loongson_pci rfkill
spi_loongson_core uio_pdrv_genirq uio lm75 fuse efi_pstore pstore zram
842_decompress 842_compress lz4hc_compress lz4_compress uas
usb_storage efivarfs [last unloaded: bpf_testmod(O)]
[ 3469.410946] Process test_progs (pid: 37338,
threadinfo=3D00000000760120b6, task=3D00000000620daecd)
[ 3469.410950] Stack : 0000000000000000 0000000000000000
0000000000000000 d665bdcea9f14eb9
[ 3469.410956]         000000000000000f 0000000000000000
90000002975dbc70 90000000076a5000
[ 3469.410961]         00007ffff1c02638 ffff8000128f0000
90000002975dbd90 900000000608ab28
[ 3469.410966]         ffff8000128f0000 0000000000000000
0000000000000000 d665bdcea9f14eb9
[ 3469.410971]         0000000000000000 90000000076a5000
90000002975dbd90 00007ffff1c02638
[ 3469.410976]         0000000000000000 000000000000000a
ffff8000128f0000 9000000004f21328
[ 3469.410981]         0000000000000000 9000000004e554c0
0000000000000000 900000010f6a4240
[ 3469.410986]         0000000129e18000 ffffffff00003500
0000000000000000 0000000000000000
[ 3469.410990]         0000000000000000 0000000000000000
0000000000000000 d665bdcea9f14eb9
[ 3469.410995]         0000000000000001 00007ffff1c03040
0000000000000000 0000000000000002
[ 3469.411000]         ...
[ 3469.411002] Call Trace:
[ 3469.411005] [<9000000004d11fb8>] handle_syscall+0xb8/0x158

[ 3469.411012] Code: 4c2e0031  31465341  00323731 <00000000> 00000000
975d8000  90000002  00000003  00402040

[ 3469.411024] ---[ end trace 0000000000000000 ]---

here is the relevant config diff between your nolockup config and my
lockup config that I suspect your nolockup config didn't cause kernel
lockup

diff -u config-nolockup config-lockup

# Debug Oops, Lockups and Hangs
 #
-# CONFIG_PANIC_ON_OOPS is not set
-CONFIG_PANIC_ON_OOPS_VALUE=3D0
+CONFIG_PANIC_ON_OOPS=3Dy
+CONFIG_PANIC_ON_OOPS_VALUE=3D1
 CONFIG_PANIC_TIMEOUT=3D0
-# CONFIG_SOFTLOCKUP_DETECTOR is not set
+CONFIG_LOCKUP_DETECTOR=3Dy
+CONFIG_SOFTLOCKUP_DETECTOR=3Dy
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
 CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
-# CONFIG_HARDLOCKUP_DETECTOR is not set
-# CONFIG_DETECT_HUNG_TASK is not set
-# CONFIG_WQ_WATCHDOG is not set
-# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
+CONFIG_HARDLOCKUP_DETECTOR=3Dy
+# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
+CONFIG_HARDLOCKUP_DETECTOR_BUDDY=3Dy
+# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
+CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=3Dy
+CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
+CONFIG_DETECT_HUNG_TASK=3Dy
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
+CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
+CONFIG_DETECT_HUNG_TASK_BLOCKER=3Dy
+CONFIG_WQ_WATCHDOG=3Dy
+CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
 # CONFIG_TEST_LOCKUP is not set
 # end of Debug Oops, Lockups and Hangs

> >
> > Have you tried to run the same  fentry_attach_stress multiple times or
> > in a loop like while true; do ./test_progs -a fentry_attach_stress;
> > sleep 1; done
> > the lockup happens intermittently, sometime it PASSED, sometime kernel
> > locks up. I merged the tools/testing/selftests/bpf/config with my
> > original config by
> > ./scripts/kconfig/merge_config.sh -y .config
> > tools/testing/selftests/bpf/config. my config seems including
> > everything  you listed above except CONFIG_ARCH_STRICT_ALIGN not set,
> > here is my config https://www.bpfire.net/download/loongfire/config.txt
> >
> > > Thanks,
> > > Tiezhu
> > >
