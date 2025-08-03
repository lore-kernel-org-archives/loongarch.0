Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B311DFF0
	for <loongarch@lists.linux.dev>; Sun,  3 Aug 2025 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754234706; cv=none; b=jAyth4ypI7kCZ0g0O9a1LuZefclTYIYweL7KT9yjRYvD+HhayPnuJo2oT+nQ1wrudkNsoEWEqoMq8STg7KDlzXOtl4rAhHBpMTX174JwBJ+V6Z3p/gjFZxHz4oTlH7bAr8V5r1rJEm+T91TTbFokMOOK2TajEWQrFjDEJB7kAro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754234706; c=relaxed/simple;
	bh=jrnPYWlB6v2XJQV1WYn7uRpxLwyP3gXFGBrOcDmPkNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgGBkI68dAWnAC0QoULYvle7BV49bduqfvbjqpGOKE+egK+wU0i30LeNiIdmdYfQcg7EmrDLoIvnslv9J37r+XjPMpFj5+ZLypv/hmMJ5Vfx2MaiJF86mqVb1vEApF5M5auqg9My+nH4RKh/3YulIvxxQbFU9xJdg1diGVu7Lfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfWlpdyA; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfWlpdyA"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4af1c1b5b38so9766421cf.1
        for <loongarch@lists.linux.dev>; Sun, 03 Aug 2025 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754234703; x=1754839503; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6KEnl3FWes/pVdeyOUXZWO0Za4DaxwrVMWnh4n/u/c=;
        b=ZfWlpdyATNPj5b65kJok6T89SbPgpQwcStczeCaQXR4sBvg+mvZteD77NKByC712Zs
         JWfhVrNcvpvXL7ez5CIawTPT+NzMoIiUtqffIh273DxsqYR+kQVTqEj6p0nWp/t0+ihx
         +rKZaZezlL7+YbKuiGtIW4Lr6cdrPc7Eph1wj8yJgDr8thX/wHM59SrpoH6dWo0ulWCz
         lXv9ZmViTiI0B8EVFbeuMKw+iRr9XDIrjCUc6yvSus9WdrBQbFyrFlL/GvE0bRt8I0Ji
         AxYywBBDDm8SeIrXDm2tSL+iJ2Zh8Pq+1VEq1sMcxEhZ5uA/HQgWZWVpOPqVbEWHO6fq
         j5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754234703; x=1754839503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6KEnl3FWes/pVdeyOUXZWO0Za4DaxwrVMWnh4n/u/c=;
        b=hfFnFTbs1IgzV0+vRXHI9XjjT2OE4ypXM1oo5O3+wTDZIItzr0J1qI1eGauqhCMqNN
         CO83mgoCNZwWlFWlJKzJbj7uw7oY5AjT+O+u3DO+gTl6SLxTvkMcg/cyackouXDmExv+
         m33v8YqU/e/1rHqzZb4hGR7UQv8o+J8CGhBgRvRjnPFky+vB+QTKQWz62/SFplvXjpeP
         Im7qiOMAp5kOkWh2oleXQQcpa3BYpMooQ2rpk0uXLhSgK3Jk0QHxyP8S9u/AWj1lIwZl
         tRajWrlDG62nQ1tcY9+fhNTKOj2dKFkaxhkHx6EZuETV8nSrmGl5K4pZMvzpWSHnPc7J
         snPw==
X-Forwarded-Encrypted: i=1; AJvYcCWH4al1XE7tjmCjG0qwQv5pgkcV30ctNEneDG3Eykl0L6E88kYJre7Zh+2SGQXUB7gQIZJSIdl9IpA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwldXsp2m+0IoB4A4fTjkNRn60nNJXdnaMCEhCoVR0oqCZfUYaz
	YO1r+gMN195whreuj6/if0pu9yAQlAa/ZEJRoUh/IZ+RzcZ7cF+gKJtnE55OcT3COM8ppBgDSCo
	BmHkUEAKoXimApfGsSL7EemoqBhvnXHE=
X-Gm-Gg: ASbGncsIpaChIpa6EbaqtypURJ85GAjTvI5OkXY5DY4xaulzmvbuoWocXLc8GihBgbG
	VwcRwvJw1hCOT+xLzCu3rDxRtwNVIa2Z0nIXHpqMJ5ZPYovOThTyerVCAZfLTiI3S4M3BNmEo31
	AGkVo4HYft8gaNhwAJvI+sMLdUYhT0j/thsID13Ak5sBVl084FkwysCZz7AO8zzQYfy9N84K0nB
	lpxRWc=
X-Google-Smtp-Source: AGHT+IEZE+zBkxm2YGeJfobqYWjbFh6Z20uM7ICkSXuaSNZCSHWQeV+NAhyJw4dXkC1tz9A6PZ9goxWpNnqSI6e/LKU=
X-Received: by 2002:a05:622a:4f11:b0:4af:1712:acc9 with SMTP id
 d75a77b69052e-4af1712af68mr76303931cf.38.1754234702971; Sun, 03 Aug 2025
 08:25:02 -0700 (PDT)
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
 <CAK3+h2zFRQNcjf_B+4yORbGp85bXAUSGX-VWt3kR1ZJomkhtHQ@mail.gmail.com> <CAAhV-H5K3r2-r8S8-qd5amZOV5x7JO9MHjVQbyfO9yXuGxJt6g@mail.gmail.com>
In-Reply-To: <CAAhV-H5K3r2-r8S8-qd5amZOV5x7JO9MHjVQbyfO9yXuGxJt6g@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 3 Aug 2025 08:24:52 -0700
X-Gm-Features: Ac12FXw8BijLfrWigBNuDuxATk5IHAN1FlPkz0IaNyxe8Fw1QlmP22bgQfHYoRY
Message-ID: <CAK3+h2xNgN87GqDMKwy9Bk2eV5zGY3Typ-e3CY0SafURfU7DLQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	hengqi.chen@gmail.com, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 3, 2025 at 7:11=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> On Sat, Aug 2, 2025 at 11:52=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > On Sat, Aug 2, 2025 at 7:47=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.=
com> wrote:
> > >
> > > On Sat, Aug 2, 2025 at 6:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmai=
l.com> wrote:
> > > >
> > > > On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loon=
gson.cn> wrote:
> > > > >
> > > > > On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > > > > > Hi Chenghao,
> > > > > >
> > > > > > I trimmed the email recipients only to the loongarch mailing li=
st and
> > > > > > folks who might pay attention to this, I personally don't like =
to
> > > > > > bother other people who may not be interested in this :). Folks=
 let me
> > > > > > know if this  is not ok. anyway, please check my bpf selftest r=
esult
> > > > > > inline.  The fentry_attach_stress results in kernel lockup.
> > > > >
> > > > > It passed on my test environment.
> > > > >
> > > > >    $ sudo ./test_progs -a fentry_attach_stress
> > > > >    #104     fentry_attach_stress:OK
> > > > >    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > >
> > > > > I used loongson3_defconfig and the following additional configs:
> > > > >
> > > > > CONFIG_KPROBES=3Dy
> > > > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > > > > CONFIG_TEST_BPF=3Dm
> > > > > CONFIG_FTRACE=3Dy
> > > > > CONFIG_FUNCTION_TRACER=3Dy
> > > > > CONFIG_DYNAMIC_FTRACE=3Dy
> > > > > CONFIG_FPROBE=3Dy
> > > > > CONFIG_FTRACE_SYSCALLS=3Dy
> > > > > CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> > > > > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > > > > CONFIG_DEBUG_INFO_BTF=3Dy
> > > > > CONFIG_NET_SCH_BPF=3Dy
> > > > > CONFIG_BPF_LSM=3Dy
> > > > > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > > > > CONFIG_ARCH_STRICT_ALIGN=3Dn
> > > > >
> > > > > I am not sure whether it is related with configs, you can test it=
 again.
> > > > >
> > >
> > > I did:
> > >   cp arch/loongarch/configs/loongson3_defconfig .config
> > >   ./scripts/kconfig/merge_config.sh -y .config config-tiezhu(your abo=
ve config)
> > > indeed I could not reproduce the lockup, even run the test in a loop.
> > > it seems to be related to the kernel config I use, maybe you could tr=
y
> > > my kernel config?
> > >
> > > [root@fedora bpf]# while true; do ./test_progs -a
> > > fentry_attach_stress; sleep 1; done
> > > #105     fentry_attach_stress:OK
> > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > #105     fentry_attach_stress:OK
> > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > >
> > > #105     fentry_attach_stress:OK
> > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > #105     fentry_attach_stress:OK
> > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > #105     fentry_attach_stress:OK
> > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > #105     fentry_attach_stress:OK
> > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > #105     fentry_attach_stress:OK
> > >
> >
> > while checking dmesg with your nolockup config, I see following log:
> >
> > [ 3469.410821] Hardware name: Loongson
> > Loongson-3A6000-7A2000-NUC/Loongson-3A6000-7A2000-NUC, BIOS
> > Loongson-UDK2018-V4.0.05759-stable202405 07/12/24 15:49:14
> > [ 3469.410824] pc 90000002456d4880 ra 90000000060885f4 tp
> > 90000002975d8000 sp 90000002975dbc10
> > [ 3469.410826] a0 0000000000000000 a1 ffff8000128f0048 a2
> > 00007ffff1c02638 a3 0000000000000000
> > [ 3469.410828] a4 00007ffff1c02680 a5 00007ffff0ce0f20 a6
> > 00007ffff0ce0f20 a7 0000000000000118
> > [ 3469.410830] t0 ffff80000338dd44 t1 90000002456d4880 t2
> > d665bdcea9f14eb9 t3 90000001dc9c1000
> > [ 3469.410832] t4 90000001dea99670 t5 0000000000000000 t6
> > 0000000000000000 t7 0000000000000000
> > [ 3469.410834] t8 000000000000000f u0 000000000000000a s9
> > 90000002975dbec0 s0 90000002975dbc70
> > [ 3469.410836] s1 0000000000000000 s2 90000000076a5000 s3
> > 0000000000000000 s4 ffff8000128f0000
> > [ 3469.410838] s5 0000000000000000 s6 0000000000000000 s7
> > 0000000000000050 s8 fffffffffffffdf4
> > [ 3469.410840]    ra: 90000000060885f4 __bpf_prog_test_run_raw_tp+0x6c/=
0x108
> > [ 3469.410848]   ERA: 90000002456d4880 0x90000002456d4880
> > [ 3469.410851]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -W=
E)
> > [ 3469.410860]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > [ 3469.410865]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> > [ 3469.410870]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> > [ 3469.410875] ESTAT: 000d0000 [INE] (IS=3D ECode=3D13 EsubCode=3D0)
> > [ 3469.410878]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000)
> > [ 3469.410880] Modules linked in: bpf_testmod(O) tls nft_fib_inet
> > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> > nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
> > nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink cmac
> > algif_hash algif_skcipher af_alg bnep vfat fat rtw88_8821ce
> > rtw88_8821c rtw88_pci rtw88_core mac80211 btusb libarc4 btrtl btbcm
> > btmtk btintel cfg80211 bluetooth sha3_generic kvm jitterentropy_rng
> > drbg ecdh_generic ecc loongson3_cpufreq spi_loongson_pci rfkill
> > spi_loongson_core uio_pdrv_genirq uio lm75 fuse efi_pstore pstore zram
> > 842_decompress 842_compress lz4hc_compress lz4_compress uas
> > usb_storage efivarfs [last unloaded: bpf_testmod(O)]
> > [ 3469.410946] Process test_progs (pid: 37338,
> > threadinfo=3D00000000760120b6, task=3D00000000620daecd)
> > [ 3469.410950] Stack : 0000000000000000 0000000000000000
> > 0000000000000000 d665bdcea9f14eb9
> > [ 3469.410956]         000000000000000f 0000000000000000
> > 90000002975dbc70 90000000076a5000
> > [ 3469.410961]         00007ffff1c02638 ffff8000128f0000
> > 90000002975dbd90 900000000608ab28
> > [ 3469.410966]         ffff8000128f0000 0000000000000000
> > 0000000000000000 d665bdcea9f14eb9
> > [ 3469.410971]         0000000000000000 90000000076a5000
> > 90000002975dbd90 00007ffff1c02638
> > [ 3469.410976]         0000000000000000 000000000000000a
> > ffff8000128f0000 9000000004f21328
> > [ 3469.410981]         0000000000000000 9000000004e554c0
> > 0000000000000000 900000010f6a4240
> > [ 3469.410986]         0000000129e18000 ffffffff00003500
> > 0000000000000000 0000000000000000
> > [ 3469.410990]         0000000000000000 0000000000000000
> > 0000000000000000 d665bdcea9f14eb9
> > [ 3469.410995]         0000000000000001 00007ffff1c03040
> > 0000000000000000 0000000000000002
> > [ 3469.411000]         ...
> > [ 3469.411002] Call Trace:
> > [ 3469.411005] [<9000000004d11fb8>] handle_syscall+0xb8/0x158
> >
> > [ 3469.411012] Code: 4c2e0031  31465341  00323731 <00000000> 00000000
> > 975d8000  90000002  00000003  00402040
> >
> > [ 3469.411024] ---[ end trace 0000000000000000 ]---
> >
> > here is the relevant config diff between your nolockup config and my
> > lockup config that I suspect your nolockup config didn't cause kernel
> > lockup
> >
> > diff -u config-nolockup config-lockup
> >
> > # Debug Oops, Lockups and Hangs
> >  #
> > -# CONFIG_PANIC_ON_OOPS is not set
> > -CONFIG_PANIC_ON_OOPS_VALUE=3D0
> > +CONFIG_PANIC_ON_OOPS=3Dy
> > +CONFIG_PANIC_ON_OOPS_VALUE=3D1
> >  CONFIG_PANIC_TIMEOUT=3D0
> > -# CONFIG_SOFTLOCKUP_DETECTOR is not set
> > +CONFIG_LOCKUP_DETECTOR=3Dy
> > +CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> >  CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > -# CONFIG_HARDLOCKUP_DETECTOR is not set
> > -# CONFIG_DETECT_HUNG_TASK is not set
> > -# CONFIG_WQ_WATCHDOG is not set
> > -# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
> > +CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > +# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
> > +CONFIG_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > +# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
> > +CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=3Dy
> > +CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> > +CONFIG_DETECT_HUNG_TASK=3Dy
> > +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> > +CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> > +CONFIG_DETECT_HUNG_TASK_BLOCKER=3Dy
> > +CONFIG_WQ_WATCHDOG=3Dy
> > +CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> >  # CONFIG_TEST_LOCKUP is not set
> >  # end of Debug Oops, Lockups and Hangs
> Hi, Vincent,
>
> I have applied all BPF patches with some small modifications. Can you
> test it again?
> https://web.git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loon=
gson.git/log/?h=3Dloongarch-next
>
> Huacai
>
I see you applied the tail call bug patches, I thought about applying
tail call patches just in case, but I am not sure the
fentry_attach_stress involves tail call count bugs. I tried your
loongarch-next branch anyway, but the lockup still happens when I run
fentry_attach_stress in a while loop. I am not sure if this particular
test should block the merge of bpf trampoline patches, it looks to be
an extreme and rare case, maybe track it as a bug report and fix it
later after merge? just my two cents :)

[root@fedora ~]# cd /usr/src/linux-loongson/
[root@fedora linux-loongson]# git branch
* loongarch-next
  master
[root@fedora linux-loongson]# uname -a
Linux fedora 6.16.0+ #1 SMP PREEMPT_DYNAMIC Sun Aug  3 08:01:34 PDT
2025 loongarch64 GNU/Linux

[root@fedora linux-loongson]# cd tools/testing/selftests/bpf/
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_stress
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

[root@fedora bpf]# while true; do ./test_progs -a
fentry_attach_stress; sleep 5; done
client_loop: send disconnect: Broken pipe

> >
> > > >
> > > > Have you tried to run the same  fentry_attach_stress multiple times=
 or
> > > > in a loop like while true; do ./test_progs -a fentry_attach_stress;
> > > > sleep 1; done
> > > > the lockup happens intermittently, sometime it PASSED, sometime ker=
nel
> > > > locks up. I merged the tools/testing/selftests/bpf/config with my
> > > > original config by
> > > > ./scripts/kconfig/merge_config.sh -y .config
> > > > tools/testing/selftests/bpf/config. my config seems including
> > > > everything  you listed above except CONFIG_ARCH_STRICT_ALIGN not se=
t,
> > > > here is my config https://www.bpfire.net/download/loongfire/config.=
txt
> > > >
> > > > > Thanks,
> > > > > Tiezhu
> > > > >
