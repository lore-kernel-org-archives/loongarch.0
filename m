Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6447E13D521
	for <loongarch@lists.linux.dev>; Sun,  3 Aug 2025 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754230260; cv=none; b=rBAXEOLqBOD707r681MksgCkq2NFAOBsicIljQUxw8FWF84FO0c9Dovegkv4cWem7zY3kIQPK7rewYa13M6F7qiyn6HT/wTTxj37tf5xalShj+Cmd5wIqxWRvMLCEcVlWe29/39BEA2IiCcc2rrlzDHg7xZ4SfCY85Fu46yUVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754230260; c=relaxed/simple;
	bh=RjwdshCXX6yWoDIGe5oi4F23kVHwNB8khm0VrkgQy9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWPsgIG5kp1tvgrWBihvzkXL15HkTY4bV/QX76dTpTPd34YjWqNcndzxp0VzKOugaxvxHFhts3woahv8O02lKZ6U+V+oH7s9nW50JxCUWDvjEbbBCpuptmpiTiK4WbDGQAyVEMCcrNNhYQywfuYh3fpuS36K8It9m4kj2xltKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzooE6gm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzooE6gm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BACC4CEF9
	for <loongarch@lists.linux.dev>; Sun,  3 Aug 2025 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754230259;
	bh=RjwdshCXX6yWoDIGe5oi4F23kVHwNB8khm0VrkgQy9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SzooE6gmalBfySSYRqiF+cxDClrGOt5ecfo4PJFxOloUboBLA831KazA6FLjUyyVy
	 AsNITi6HHNEE6XdVAi8YtJAi/H2hmvOIL80Z48rpqlsBzNIiFaz9XbHC83jM8A4xLa
	 m/Cougj0BGkbrZBzXE5ayXiDGcxbq5Wxihi+wAFzJFzzAR9qjkmuNo/8On4ZxQFPwn
	 3ZGnXmA4clSpnVenSBqyFEIgdNhAP8Lk5AdqjBGY776Mjn9+PPruRK9mAJq2GWD7xE
	 MvfhhYe1NIq+CLOhjUixL+geWiBYKOEOaFtPeadP9MmtylIQ5AdTq/ikPRKnrPnzWJ
	 ORdzw2OpbYdfA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6152faff57eso6293900a12.1
        for <loongarch@lists.linux.dev>; Sun, 03 Aug 2025 07:10:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyRH3DWQIUdi6B4FVyjlL8A8gDCOawPo9xN77wQgOF307/CQetjDhUG5U2rMz3HZ1cGp+THtUkVPc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwngNz7HHZPLZyGX0aPcdpA5S3BtfMx3QrK1VpAwSULvrV2/eSk
	s1jJ/00d10cz3TfyKdqfzPSyEW4hFg/j5cIxkKgNSACfzcrzXxnG1oublBlYK6rYFj8VJhhO7yA
	9ESgJabwDWCsnXPDrImYvWcaoY0ndUYs=
X-Google-Smtp-Source: AGHT+IEPIKCDbpXYXaQHl8EonpIWjD1uBAwgBTnPnRMFRwMaLc3BZ7WjrjcT/qQxhyf/ROK5WUovdEtKn7KPWwPnc1E=
X-Received: by 2002:a05:6402:1eca:b0:615:c7b3:109b with SMTP id
 4fb4d7f45d1cf-615e6f50cecmr5232524a12.21.1754230258325; Sun, 03 Aug 2025
 07:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn>
 <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
 <84789726-18a6-b46f-3ece-f887599ccf4a@loongson.cn> <CAK3+h2x4MWR677UPTdAGX8jUg7EC_iweCKh8S1FMWSVVVsO8oA@mail.gmail.com>
 <CAK3+h2y-7h=D5NaO=v8u7HaoHQ+MdhAvsH4drpZxypbr+ABodg@mail.gmail.com> <CAK3+h2zFRQNcjf_B+4yORbGp85bXAUSGX-VWt3kR1ZJomkhtHQ@mail.gmail.com>
In-Reply-To: <CAK3+h2zFRQNcjf_B+4yORbGp85bXAUSGX-VWt3kR1ZJomkhtHQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 3 Aug 2025 22:10:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5K3r2-r8S8-qd5amZOV5x7JO9MHjVQbyfO9yXuGxJt6g@mail.gmail.com>
X-Gm-Features: Ac12FXwkV_0CB3LQ3jdMK1PY1fPut9H8TZStRvoYAl75QjHN8YZQ9CZRqNem3Vs
Message-ID: <CAAhV-H5K3r2-r8S8-qd5amZOV5x7JO9MHjVQbyfO9yXuGxJt6g@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	hengqi.chen@gmail.com, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 11:52=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Sat, Aug 2, 2025 at 7:47=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > On Sat, Aug 2, 2025 at 6:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.=
com> wrote:
> > >
> > > On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongs=
on.cn> wrote:
> > > >
> > > > On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > > > > Hi Chenghao,
> > > > >
> > > > > I trimmed the email recipients only to the loongarch mailing list=
 and
> > > > > folks who might pay attention to this, I personally don't like to
> > > > > bother other people who may not be interested in this :). Folks l=
et me
> > > > > know if this  is not ok. anyway, please check my bpf selftest res=
ult
> > > > > inline.  The fentry_attach_stress results in kernel lockup.
> > > >
> > > > It passed on my test environment.
> > > >
> > > >    $ sudo ./test_progs -a fentry_attach_stress
> > > >    #104     fentry_attach_stress:OK
> > > >    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > >
> > > > I used loongson3_defconfig and the following additional configs:
> > > >
> > > > CONFIG_KPROBES=3Dy
> > > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > > > CONFIG_TEST_BPF=3Dm
> > > > CONFIG_FTRACE=3Dy
> > > > CONFIG_FUNCTION_TRACER=3Dy
> > > > CONFIG_DYNAMIC_FTRACE=3Dy
> > > > CONFIG_FPROBE=3Dy
> > > > CONFIG_FTRACE_SYSCALLS=3Dy
> > > > CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> > > > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > > > CONFIG_DEBUG_INFO_BTF=3Dy
> > > > CONFIG_NET_SCH_BPF=3Dy
> > > > CONFIG_BPF_LSM=3Dy
> > > > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > > > CONFIG_ARCH_STRICT_ALIGN=3Dn
> > > >
> > > > I am not sure whether it is related with configs, you can test it a=
gain.
> > > >
> >
> > I did:
> >   cp arch/loongarch/configs/loongson3_defconfig .config
> >   ./scripts/kconfig/merge_config.sh -y .config config-tiezhu(your above=
 config)
> > indeed I could not reproduce the lockup, even run the test in a loop.
> > it seems to be related to the kernel config I use, maybe you could try
> > my kernel config?
> >
> > [root@fedora bpf]# while true; do ./test_progs -a
> > fentry_attach_stress; sleep 1; done
> > #105     fentry_attach_stress:OK
> > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > #105     fentry_attach_stress:OK
> > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> >
> > #105     fentry_attach_stress:OK
> > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > #105     fentry_attach_stress:OK
> > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > #105     fentry_attach_stress:OK
> > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > #105     fentry_attach_stress:OK
> > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > #105     fentry_attach_stress:OK
> >
>
> while checking dmesg with your nolockup config, I see following log:
>
> [ 3469.410821] Hardware name: Loongson
> Loongson-3A6000-7A2000-NUC/Loongson-3A6000-7A2000-NUC, BIOS
> Loongson-UDK2018-V4.0.05759-stable202405 07/12/24 15:49:14
> [ 3469.410824] pc 90000002456d4880 ra 90000000060885f4 tp
> 90000002975d8000 sp 90000002975dbc10
> [ 3469.410826] a0 0000000000000000 a1 ffff8000128f0048 a2
> 00007ffff1c02638 a3 0000000000000000
> [ 3469.410828] a4 00007ffff1c02680 a5 00007ffff0ce0f20 a6
> 00007ffff0ce0f20 a7 0000000000000118
> [ 3469.410830] t0 ffff80000338dd44 t1 90000002456d4880 t2
> d665bdcea9f14eb9 t3 90000001dc9c1000
> [ 3469.410832] t4 90000001dea99670 t5 0000000000000000 t6
> 0000000000000000 t7 0000000000000000
> [ 3469.410834] t8 000000000000000f u0 000000000000000a s9
> 90000002975dbec0 s0 90000002975dbc70
> [ 3469.410836] s1 0000000000000000 s2 90000000076a5000 s3
> 0000000000000000 s4 ffff8000128f0000
> [ 3469.410838] s5 0000000000000000 s6 0000000000000000 s7
> 0000000000000050 s8 fffffffffffffdf4
> [ 3469.410840]    ra: 90000000060885f4 __bpf_prog_test_run_raw_tp+0x6c/0x=
108
> [ 3469.410848]   ERA: 90000002456d4880 0x90000002456d4880
> [ 3469.410851]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> [ 3469.410860]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> [ 3469.410865]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> [ 3469.410870]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> [ 3469.410875] ESTAT: 000d0000 [INE] (IS=3D ECode=3D13 EsubCode=3D0)
> [ 3469.410878]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000)
> [ 3469.410880] Modules linked in: bpf_testmod(O) tls nft_fib_inet
> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
> nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink cmac
> algif_hash algif_skcipher af_alg bnep vfat fat rtw88_8821ce
> rtw88_8821c rtw88_pci rtw88_core mac80211 btusb libarc4 btrtl btbcm
> btmtk btintel cfg80211 bluetooth sha3_generic kvm jitterentropy_rng
> drbg ecdh_generic ecc loongson3_cpufreq spi_loongson_pci rfkill
> spi_loongson_core uio_pdrv_genirq uio lm75 fuse efi_pstore pstore zram
> 842_decompress 842_compress lz4hc_compress lz4_compress uas
> usb_storage efivarfs [last unloaded: bpf_testmod(O)]
> [ 3469.410946] Process test_progs (pid: 37338,
> threadinfo=3D00000000760120b6, task=3D00000000620daecd)
> [ 3469.410950] Stack : 0000000000000000 0000000000000000
> 0000000000000000 d665bdcea9f14eb9
> [ 3469.410956]         000000000000000f 0000000000000000
> 90000002975dbc70 90000000076a5000
> [ 3469.410961]         00007ffff1c02638 ffff8000128f0000
> 90000002975dbd90 900000000608ab28
> [ 3469.410966]         ffff8000128f0000 0000000000000000
> 0000000000000000 d665bdcea9f14eb9
> [ 3469.410971]         0000000000000000 90000000076a5000
> 90000002975dbd90 00007ffff1c02638
> [ 3469.410976]         0000000000000000 000000000000000a
> ffff8000128f0000 9000000004f21328
> [ 3469.410981]         0000000000000000 9000000004e554c0
> 0000000000000000 900000010f6a4240
> [ 3469.410986]         0000000129e18000 ffffffff00003500
> 0000000000000000 0000000000000000
> [ 3469.410990]         0000000000000000 0000000000000000
> 0000000000000000 d665bdcea9f14eb9
> [ 3469.410995]         0000000000000001 00007ffff1c03040
> 0000000000000000 0000000000000002
> [ 3469.411000]         ...
> [ 3469.411002] Call Trace:
> [ 3469.411005] [<9000000004d11fb8>] handle_syscall+0xb8/0x158
>
> [ 3469.411012] Code: 4c2e0031  31465341  00323731 <00000000> 00000000
> 975d8000  90000002  00000003  00402040
>
> [ 3469.411024] ---[ end trace 0000000000000000 ]---
>
> here is the relevant config diff between your nolockup config and my
> lockup config that I suspect your nolockup config didn't cause kernel
> lockup
>
> diff -u config-nolockup config-lockup
>
> # Debug Oops, Lockups and Hangs
>  #
> -# CONFIG_PANIC_ON_OOPS is not set
> -CONFIG_PANIC_ON_OOPS_VALUE=3D0
> +CONFIG_PANIC_ON_OOPS=3Dy
> +CONFIG_PANIC_ON_OOPS_VALUE=3D1
>  CONFIG_PANIC_TIMEOUT=3D0
> -# CONFIG_SOFTLOCKUP_DETECTOR is not set
> +CONFIG_LOCKUP_DETECTOR=3Dy
> +CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
>  CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> -# CONFIG_HARDLOCKUP_DETECTOR is not set
> -# CONFIG_DETECT_HUNG_TASK is not set
> -# CONFIG_WQ_WATCHDOG is not set
> -# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
> +CONFIG_HARDLOCKUP_DETECTOR=3Dy
> +# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
> +CONFIG_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> +# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
> +CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=3Dy
> +CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> +CONFIG_DETECT_HUNG_TASK=3Dy
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> +CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> +CONFIG_DETECT_HUNG_TASK_BLOCKER=3Dy
> +CONFIG_WQ_WATCHDOG=3Dy
> +CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
>  # CONFIG_TEST_LOCKUP is not set
>  # end of Debug Oops, Lockups and Hangs
Hi, Vincent,

I have applied all BPF patches with some small modifications. Can you
test it again?
https://web.git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongs=
on.git/log/?h=3Dloongarch-next

Huacai

>
> > >
> > > Have you tried to run the same  fentry_attach_stress multiple times o=
r
> > > in a loop like while true; do ./test_progs -a fentry_attach_stress;
> > > sleep 1; done
> > > the lockup happens intermittently, sometime it PASSED, sometime kerne=
l
> > > locks up. I merged the tools/testing/selftests/bpf/config with my
> > > original config by
> > > ./scripts/kconfig/merge_config.sh -y .config
> > > tools/testing/selftests/bpf/config. my config seems including
> > > everything  you listed above except CONFIG_ARCH_STRICT_ALIGN not set,
> > > here is my config https://www.bpfire.net/download/loongfire/config.tx=
t
> > >
> > > > Thanks,
> > > > Tiezhu
> > > >
