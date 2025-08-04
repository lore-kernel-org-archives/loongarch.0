Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33FBA3D
	for <loongarch@lists.linux.dev>; Mon,  4 Aug 2025 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754273587; cv=none; b=YnILMyNf6tMuJYts8vVyjXhpeFSapVlOkvbkNBJ3BaQ8cmjtjgf1rJpVwqL9JgaxZdUfhCNqY8kGlG91a7OVcRMWLP5zf6u2ynO1PgxTOtJ27h3VfkJhWe052ERQLRpifvlaai3hRXWIF6WXIhZP5h0mD2w9W8h6Xbkc6chWbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754273587; c=relaxed/simple;
	bh=HYYaxc5GbvN9oyD6w2RvDpoeB3waIihjOvK0IJwCFAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjUKdVrLPMRG78x+YjRNCWpYJPom8mZ8zynH64rU7+WdXv5JImm0gpOM+uOtlTA3pe8ssUHwzjk1EoNvjdoY42DUb1oeSRH8LIzG8ygXuzSFDP5p7nlGBbasniIKlPdNA2TvX6ATp7gTGgv3g9bxcWuKAULiI2FYrT4tGXJ7Z/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqvrJCzt; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqvrJCzt"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-30b6c230808so268696fac.3
        for <loongarch@lists.linux.dev>; Sun, 03 Aug 2025 19:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754273584; x=1754878384; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=958JgoMI9jI3IZwW0oMtBPmHOsqns1AF4dq8ZF70zQ0=;
        b=LqvrJCztyx9OYvbmM52Rpd6Gwvp4FNzRCQtHNriejDk8NRgruDUcNHZT/PmjUhgFoS
         w2Udpv7k2f0oRXpv391Hp50QZ8W3YeNOZi8hY5Oxay8D5I68UtYb4u7rnYORJe96axCq
         aqwl7cFiIH1TJykJhB1cAiemlQTrx+beWbiGGuhqCiKFEy31pt/9ApEwa4mx4Zq6FclG
         m0CMuws6pQ0mMoiztYHg7Smkc+7wnN7fQEoAbsuYg0wHqzN/VBcRAbKLnQaNNzXjomzw
         I4a93Ub5nBpftkL1cauCVqU/v0VcWQKU56aCJNoGFf1Y0nuDrs8Z3p5LHMhCHwbMgDEg
         KIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754273584; x=1754878384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=958JgoMI9jI3IZwW0oMtBPmHOsqns1AF4dq8ZF70zQ0=;
        b=GpFh9hRpnIhmkU3GN9C8YobL4l7LIPKPhkhgGxaj1SseVD+g79cwYNqNQ0oTd0z0qs
         r5YMxb3dd486EYokOSkP8hzwFfJahcKKL8rsbzDzExxqgsUYTKGWPRUU2hG7NIObx9BJ
         66WZ5I+m10kCfMeruakFi1gvZL3y2O9d98CS/Wrn5Y7X/HQI86JlGBEnaltFbbIMvPGj
         wO8xi2Xj0B4ESZ1KIQq9Jvnk1Uwk1xRgCWwwkgUIpEKAx6d0CY2at26M4SU/SdBrKAtr
         8wJciuvpjqtndjJnjc9EZ+JKnQMPlIGAXiFn+R5k6N+leV2XOfEda+BgLv4fORBRnMMA
         F7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+gVZFb0hKJVX/EAgKWv+C70jyFLhw7p9X+BK4v1y1MEfd24hgc/6J3rdVHXLH4YE8PqWJ4vjitZE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxeu2fWGTaFL7ddtapgtATFFCuYRf3D3tNjO54AUcydjwcL/iqy
	ZCUseY9nS7uvPt8Uj4xhwVa1NYfA2pzIUBEnQvs69vJBRYjLFflCriHy6N+K/9XSDJwSNDlO9Tv
	EI6AHTqQu5Zt4Xl/QPbJmXF88WpMkoa8=
X-Gm-Gg: ASbGnct6C3iI5cEPfQHD4YTVYKO8x/R72fbTy5H9T3YRSzq8K0y+pJwdx8muSQ03Gd1
	mtSopZnMe+r33eb0TDTWLlUffRN5g/6vETiyYvO4A8w7GMfOi45topSMW6ZeR+XntOuHuQMqWWD
	O6Owz6PP5vIqejTkY0z37oEj9/lloMmsst5y+CvlBBZAwFiD6hakGtXx9TIkbDlWXglNorM74rt
	dKOmiw=
X-Google-Smtp-Source: AGHT+IE8trfwtFiz72lP+Nngd8l3bAttwXfNhzPYD5rWQUaOImok0wPG/JlhOe5HVNrVq27Hq0/IFiglfcGWd9Aj4tA=
X-Received: by 2002:a05:6808:178e:b0:434:ee4:b95b with SMTP id
 5614622812f47-4340ee4c557mr597069b6e.39.1754273584402; Sun, 03 Aug 2025
 19:13:04 -0700 (PDT)
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
 <CAK3+h2zFRQNcjf_B+4yORbGp85bXAUSGX-VWt3kR1ZJomkhtHQ@mail.gmail.com>
 <CAAhV-H5K3r2-r8S8-qd5amZOV5x7JO9MHjVQbyfO9yXuGxJt6g@mail.gmail.com> <CAK3+h2xNgN87GqDMKwy9Bk2eV5zGY3Typ-e3CY0SafURfU7DLQ@mail.gmail.com>
In-Reply-To: <CAK3+h2xNgN87GqDMKwy9Bk2eV5zGY3Typ-e3CY0SafURfU7DLQ@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 4 Aug 2025 10:12:53 +0800
X-Gm-Features: Ac12FXwqtC1i5E5yiHv6PJQIvqKQd5Ir0lGBTUWo7d8dO6iF_KbH_fPLSTWeZnw
Message-ID: <CAEyhmHQj+W-yDSJf=gDJRnL-OctD__mMa_pXu-udxe5v90mr8A@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 3, 2025 at 11:25=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Sun, Aug 3, 2025 at 7:11=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org=
> wrote:
> >
> > On Sat, Aug 2, 2025 at 11:52=E2=80=AFPM Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> > >
> > > On Sat, Aug 2, 2025 at 7:47=E2=80=AFAM Vincent Li <vincent.mc.li@gmai=
l.com> wrote:
> > > >
> > > > On Sat, Aug 2, 2025 at 6:53=E2=80=AFAM Vincent Li <vincent.mc.li@gm=
ail.com> wrote:
> > > > >
> > > > > On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@lo=
ongson.cn> wrote:
> > > > > >
> > > > > > On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > > > > > > Hi Chenghao,
> > > > > > >
> > > > > > > I trimmed the email recipients only to the loongarch mailing =
list and
> > > > > > > folks who might pay attention to this, I personally don't lik=
e to
> > > > > > > bother other people who may not be interested in this :). Fol=
ks let me
> > > > > > > know if this  is not ok. anyway, please check my bpf selftest=
 result
> > > > > > > inline.  The fentry_attach_stress results in kernel lockup.
> > > > > >
> > > > > > It passed on my test environment.
> > > > > >
> > > > > >    $ sudo ./test_progs -a fentry_attach_stress
> > > > > >    #104     fentry_attach_stress:OK
> > > > > >    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > >
> > > > > > I used loongson3_defconfig and the following additional configs=
:
> > > > > >
> > > > > > CONFIG_KPROBES=3Dy
> > > > > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > > > > > CONFIG_TEST_BPF=3Dm
> > > > > > CONFIG_FTRACE=3Dy
> > > > > > CONFIG_FUNCTION_TRACER=3Dy
> > > > > > CONFIG_DYNAMIC_FTRACE=3Dy
> > > > > > CONFIG_FPROBE=3Dy
> > > > > > CONFIG_FTRACE_SYSCALLS=3Dy
> > > > > > CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> > > > > > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > > > > > CONFIG_DEBUG_INFO_BTF=3Dy
> > > > > > CONFIG_NET_SCH_BPF=3Dy
> > > > > > CONFIG_BPF_LSM=3Dy
> > > > > > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > > > > > CONFIG_ARCH_STRICT_ALIGN=3Dn
> > > > > >
> > > > > > I am not sure whether it is related with configs, you can test =
it again.
> > > > > >
> > > >
> > > > I did:
> > > >   cp arch/loongarch/configs/loongson3_defconfig .config
> > > >   ./scripts/kconfig/merge_config.sh -y .config config-tiezhu(your a=
bove config)
> > > > indeed I could not reproduce the lockup, even run the test in a loo=
p.
> > > > it seems to be related to the kernel config I use, maybe you could =
try
> > > > my kernel config?
> > > >
> > > > [root@fedora bpf]# while true; do ./test_progs -a
> > > > fentry_attach_stress; sleep 1; done
> > > > #105     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > #105     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > >
> > > > #105     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > #105     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > #105     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > #105     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > #105     fentry_attach_stress:OK
> > > >
> > >
> > > while checking dmesg with your nolockup config, I see following log:
> > >
> > > [ 3469.410821] Hardware name: Loongson
> > > Loongson-3A6000-7A2000-NUC/Loongson-3A6000-7A2000-NUC, BIOS
> > > Loongson-UDK2018-V4.0.05759-stable202405 07/12/24 15:49:14
> > > [ 3469.410824] pc 90000002456d4880 ra 90000000060885f4 tp
> > > 90000002975d8000 sp 90000002975dbc10
> > > [ 3469.410826] a0 0000000000000000 a1 ffff8000128f0048 a2
> > > 00007ffff1c02638 a3 0000000000000000
> > > [ 3469.410828] a4 00007ffff1c02680 a5 00007ffff0ce0f20 a6
> > > 00007ffff0ce0f20 a7 0000000000000118
> > > [ 3469.410830] t0 ffff80000338dd44 t1 90000002456d4880 t2
> > > d665bdcea9f14eb9 t3 90000001dc9c1000
> > > [ 3469.410832] t4 90000001dea99670 t5 0000000000000000 t6
> > > 0000000000000000 t7 0000000000000000
> > > [ 3469.410834] t8 000000000000000f u0 000000000000000a s9
> > > 90000002975dbec0 s0 90000002975dbc70
> > > [ 3469.410836] s1 0000000000000000 s2 90000000076a5000 s3
> > > 0000000000000000 s4 ffff8000128f0000
> > > [ 3469.410838] s5 0000000000000000 s6 0000000000000000 s7
> > > 0000000000000050 s8 fffffffffffffdf4
> > > [ 3469.410840]    ra: 90000000060885f4 __bpf_prog_test_run_raw_tp+0x6=
c/0x108
> > > [ 3469.410848]   ERA: 90000002456d4880 0x90000002456d4880
> > > [ 3469.410851]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC =
-WE)
> > > [ 3469.410860]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > [ 3469.410865]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> > > [ 3469.410870]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> > > [ 3469.410875] ESTAT: 000d0000 [INE] (IS=3D ECode=3D13 EsubCode=3D0)
> > > [ 3469.410878]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000)
> > > [ 3469.410880] Modules linked in: bpf_testmod(O) tls nft_fib_inet
> > > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> > > nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
> > > nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink cmac
> > > algif_hash algif_skcipher af_alg bnep vfat fat rtw88_8821ce
> > > rtw88_8821c rtw88_pci rtw88_core mac80211 btusb libarc4 btrtl btbcm
> > > btmtk btintel cfg80211 bluetooth sha3_generic kvm jitterentropy_rng
> > > drbg ecdh_generic ecc loongson3_cpufreq spi_loongson_pci rfkill
> > > spi_loongson_core uio_pdrv_genirq uio lm75 fuse efi_pstore pstore zra=
m
> > > 842_decompress 842_compress lz4hc_compress lz4_compress uas
> > > usb_storage efivarfs [last unloaded: bpf_testmod(O)]
> > > [ 3469.410946] Process test_progs (pid: 37338,
> > > threadinfo=3D00000000760120b6, task=3D00000000620daecd)
> > > [ 3469.410950] Stack : 0000000000000000 0000000000000000
> > > 0000000000000000 d665bdcea9f14eb9
> > > [ 3469.410956]         000000000000000f 0000000000000000
> > > 90000002975dbc70 90000000076a5000
> > > [ 3469.410961]         00007ffff1c02638 ffff8000128f0000
> > > 90000002975dbd90 900000000608ab28
> > > [ 3469.410966]         ffff8000128f0000 0000000000000000
> > > 0000000000000000 d665bdcea9f14eb9
> > > [ 3469.410971]         0000000000000000 90000000076a5000
> > > 90000002975dbd90 00007ffff1c02638
> > > [ 3469.410976]         0000000000000000 000000000000000a
> > > ffff8000128f0000 9000000004f21328
> > > [ 3469.410981]         0000000000000000 9000000004e554c0
> > > 0000000000000000 900000010f6a4240
> > > [ 3469.410986]         0000000129e18000 ffffffff00003500
> > > 0000000000000000 0000000000000000
> > > [ 3469.410990]         0000000000000000 0000000000000000
> > > 0000000000000000 d665bdcea9f14eb9
> > > [ 3469.410995]         0000000000000001 00007ffff1c03040
> > > 0000000000000000 0000000000000002
> > > [ 3469.411000]         ...
> > > [ 3469.411002] Call Trace:
> > > [ 3469.411005] [<9000000004d11fb8>] handle_syscall+0xb8/0x158
> > >
> > > [ 3469.411012] Code: 4c2e0031  31465341  00323731 <00000000> 00000000
> > > 975d8000  90000002  00000003  00402040
> > >
> > > [ 3469.411024] ---[ end trace 0000000000000000 ]---
> > >
> > > here is the relevant config diff between your nolockup config and my
> > > lockup config that I suspect your nolockup config didn't cause kernel
> > > lockup
> > >
> > > diff -u config-nolockup config-lockup
> > >
> > > # Debug Oops, Lockups and Hangs
> > >  #
> > > -# CONFIG_PANIC_ON_OOPS is not set
> > > -CONFIG_PANIC_ON_OOPS_VALUE=3D0
> > > +CONFIG_PANIC_ON_OOPS=3Dy
> > > +CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > >  CONFIG_PANIC_TIMEOUT=3D0
> > > -# CONFIG_SOFTLOCKUP_DETECTOR is not set
> > > +CONFIG_LOCKUP_DETECTOR=3Dy
> > > +CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > > +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> > >  CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > > -# CONFIG_HARDLOCKUP_DETECTOR is not set
> > > -# CONFIG_DETECT_HUNG_TASK is not set
> > > -# CONFIG_WQ_WATCHDOG is not set
> > > -# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
> > > +CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > > +# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
> > > +CONFIG_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > > +# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
> > > +CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=3Dy
> > > +CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> > > +CONFIG_DETECT_HUNG_TASK=3Dy
> > > +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> > > +CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> > > +CONFIG_DETECT_HUNG_TASK_BLOCKER=3Dy
> > > +CONFIG_WQ_WATCHDOG=3Dy
> > > +CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> > >  # CONFIG_TEST_LOCKUP is not set
> > >  # end of Debug Oops, Lockups and Hangs
> > Hi, Vincent,
> >
> > I have applied all BPF patches with some small modifications. Can you
> > test it again?
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-lo=
ongson.git/log/?h=3Dloongarch-next
> >
> > Huacai
> >
> I see you applied the tail call bug patches, I thought about applying
> tail call patches just in case, but I am not sure the
> fentry_attach_stress involves tail call count bugs. I tried your
> loongarch-next branch anyway, but the lockup still happens when I run
> fentry_attach_stress in a while loop. I am not sure if this particular
> test should block the merge of bpf trampoline patches, it looks to be
> an extreme and rare case, maybe track it as a bug report and fix it
> later after merge? just my two cents :)
>

I think this violates the community rules. And could be a disaster in
production.

> [root@fedora ~]# cd /usr/src/linux-loongson/
> [root@fedora linux-loongson]# git branch
> * loongarch-next
>   master
> [root@fedora linux-loongson]# uname -a
> Linux fedora 6.16.0+ #1 SMP PREEMPT_DYNAMIC Sun Aug  3 08:01:34 PDT
> 2025 loongarch64 GNU/Linux
>
> [root@fedora linux-loongson]# cd tools/testing/selftests/bpf/
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> #107     fentry_attach_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>
> [root@fedora bpf]# while true; do ./test_progs -a
> fentry_attach_stress; sleep 5; done
> client_loop: send disconnect: Broken pipe
>
> > >
> > > > >
> > > > > Have you tried to run the same  fentry_attach_stress multiple tim=
es or
> > > > > in a loop like while true; do ./test_progs -a fentry_attach_stres=
s;
> > > > > sleep 1; done
> > > > > the lockup happens intermittently, sometime it PASSED, sometime k=
ernel
> > > > > locks up. I merged the tools/testing/selftests/bpf/config with my
> > > > > original config by
> > > > > ./scripts/kconfig/merge_config.sh -y .config
> > > > > tools/testing/selftests/bpf/config. my config seems including
> > > > > everything  you listed above except CONFIG_ARCH_STRICT_ALIGN not =
set,
> > > > > here is my config https://www.bpfire.net/download/loongfire/confi=
g.txt
> > > > >
> > > > > > Thanks,
> > > > > > Tiezhu
> > > > > >
