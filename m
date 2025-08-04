Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B891F137C2A
	for <loongarch@lists.linux.dev>; Mon,  4 Aug 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754319508; cv=none; b=oXvEJbGRJgmMV6ZaJMvcXQwykKseOkvN3OiNqwjFc8HzHMud/Z5vdrbPZ/G21Am4stSH4/I65UeYGZyZSoQRy3dLpCwG1bPjOfitsPZ5i5gL1PG92HGBBzFzYG95uEdzr3ssqCab60BbXEnG2moUN9K0IU/4qPVUz5BFUQnrdG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754319508; c=relaxed/simple;
	bh=4t8WKM1dmVSD2v6DThFzbjVxhfrccuaT2G3PczXlOh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhuMmOtSrpK5I96kLvZRrGleaYqujE09T9DPjMhE7EeAJfNZyRTZAExGvCO5EMkN7Gtklu1mM/S4P4EN1MvJp10HNJurLTXhBP1ko7lYMvLMAZ4HJWrLsbS99QYqcg2+DnJuLr4U9ALvnAsOkN5zOvfz/gFGeRxs7R7Hl+4eKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC96nYx/; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC96nYx/"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b064e94400so13014641cf.0
        for <loongarch@lists.linux.dev>; Mon, 04 Aug 2025 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754319504; x=1754924304; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J8UqfRWR/TANa08pshrBisfLEhL0HAAcN4e0JHZSoM=;
        b=gC96nYx/UwSdYCyZvV/ct4jjnFejQv8XMaaZ6meuXSGPDbfBztMnuUVLE8V8MlKJ6n
         OiJEFAwiXayRF2DdPaStYIZuatRHPytyNTs/M+OhEZKLRVU3xL0WbbY1mBwH2QQ73IcA
         K3sktvfgMR6qZDCmKTV5orhy+C76nESqlrFKGKjhsOnbvzDxC6ejYqXk9E+xPYbAX2py
         cFMWLCDVhbpPys26ok9BJxyiISoTeZFjK3v9a/4B6eVYOmTRvQy6nhmOcIWbaCT7WzTP
         kKYsS75oJAotBI0oN27j7cmlGnZ+/Ccj4UPN+R3a1Bdrzf+rBfENKPFJoGvmcS+MrvYA
         D+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754319504; x=1754924304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J8UqfRWR/TANa08pshrBisfLEhL0HAAcN4e0JHZSoM=;
        b=JBGXAzEj1950qUs2grMb70Xh2o2VRJAuy08/MxH8dF2aD40akJ5fdJiRKtvnPfqfdf
         hP/ELV1n9GZLuvx6dLpjpJwrmw+ghJmxogUwbksA8vAqp85bbtUtWak3F+wAYEVLK1f0
         dz8KfG69j90OBwD5qx2o0VhHci1dpxx4EOTqEMPLAGevtFUJuTo1z1l0sKpOidk0DKcr
         xhRH1rrT5jww99m9EDSaPNyFjdz5z8EwTOnmDpTA23DhJXDkCoRsNMGr8ipAAUDN790I
         jCUUE2nSN0TK7Z7YznHpHkFE7UE4QT+ePVfKBQJU/RW19KPpYFWkKqZCQQn0gP3kvR4E
         SesQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnDgyT+p5/uqciSA0NI8k1arWq0n2Ypr9f3F8hFR2NKN3/e7Bum2qkYUQVkWz7MIIxMccA1yHrtVE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1Iynt3idx4E/MX03RhURldIds0xE56Yyx4JGGmYxcfITGv8/O
	xvXQzQAlTozARq64dIrM9BT7wW7itrTXJ2zsIqzmSVM+dGOxulYO5fx7q4LWB+fqKYKfOIaND+w
	2UU5Qb8qjIRCehRNarElKDUbFG3OtwE87cKcc
X-Gm-Gg: ASbGncvdUvUvdXJio/qBxx4tz5eS4LIxR+VAMYV+uxMB5Mz+LgkHOvD08NHgfj4C/Zj
	BZZoiS31IexHBhcP7UZDxT9qSlnPR1glklkAmhi/746KS2Y8eGl6TnAKD3CbPEL29DzCQmzDkxX
	extMgL0wgl8OKYZoEBl4EulIcSq/SCJo6kLwBB1EX1IXzXTKrDzBNP0jTqWQOozEvapv0+K0hiX
	yefNn4=
X-Google-Smtp-Source: AGHT+IGksK3C87vp4tDOn+aV0y5ACiny2qp90Y96/mmkOG7D0oB1CNw3gr4MN0mzrzTw3vHFxyU2OCuzkciWewNrLx0=
X-Received: by 2002:a05:622a:c9:b0:4ab:63b9:9bf4 with SMTP id
 d75a77b69052e-4af1097b2d6mr159150841cf.1.1754319504145; Mon, 04 Aug 2025
 07:58:24 -0700 (PDT)
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
 <CAAhV-H5K3r2-r8S8-qd5amZOV5x7JO9MHjVQbyfO9yXuGxJt6g@mail.gmail.com>
 <CAK3+h2xNgN87GqDMKwy9Bk2eV5zGY3Typ-e3CY0SafURfU7DLQ@mail.gmail.com>
 <CAAhV-H48=9Z89GDR+24iZAGfOnN8z2uu8FZW18GhyCW4uH+isw@mail.gmail.com>
 <CAK3+h2zdoAtiyUiVhiTROh2t7JDroCCPTcJ79+XB_hEBTUWvnA@mail.gmail.com> <CAK3+h2x0dTxXOLKngBc-Yx_VW86T=v1VW8RAAw3mEbioAEBueA@mail.gmail.com>
In-Reply-To: <CAK3+h2x0dTxXOLKngBc-Yx_VW86T=v1VW8RAAw3mEbioAEBueA@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 4 Aug 2025 07:58:12 -0700
X-Gm-Features: Ac12FXx5L6pBkxjIwGbvssl2d_ExPqgRlqGM_EfjXKb2QmlI4xnPnCCO-qqWnxU
Message-ID: <CAK3+h2wpNdP_cmoVobK0=3UJaRgt4U+A9=fnumbHe0=WHTJfaw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	hengqi.chen@gmail.com, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 7:24=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> On Mon, Aug 4, 2025 at 6:28=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > On Mon, Aug 4, 2025 at 1:24=E2=80=AFAM Huacai Chen <chenhuacai@kernel.o=
rg> wrote:
> > >
> > > On Sun, Aug 3, 2025 at 11:25=E2=80=AFPM Vincent Li <vincent.mc.li@gma=
il.com> wrote:
> > > >
> > > > On Sun, Aug 3, 2025 at 7:11=E2=80=AFAM Huacai Chen <chenhuacai@kern=
el.org> wrote:
> > > > >
> > > > > On Sat, Aug 2, 2025 at 11:52=E2=80=AFPM Vincent Li <vincent.mc.li=
@gmail.com> wrote:
> > > > > >
> > > > > > On Sat, Aug 2, 2025 at 7:47=E2=80=AFAM Vincent Li <vincent.mc.l=
i@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, Aug 2, 2025 at 6:53=E2=80=AFAM Vincent Li <vincent.mc=
.li@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangtie=
zhu@loongson.cn> wrote:
> > > > > > > > >
> > > > > > > > > On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > > > > > > > > > Hi Chenghao,
> > > > > > > > > >
> > > > > > > > > > I trimmed the email recipients only to the loongarch ma=
iling list and
> > > > > > > > > > folks who might pay attention to this, I personally don=
't like to
> > > > > > > > > > bother other people who may not be interested in this :=
). Folks let me
> > > > > > > > > > know if this  is not ok. anyway, please check my bpf se=
lftest result
> > > > > > > > > > inline.  The fentry_attach_stress results in kernel loc=
kup.
> > > > > > > > >
> > > > > > > > > It passed on my test environment.
> > > > > > > > >
> > > > > > > > >    $ sudo ./test_progs -a fentry_attach_stress
> > > > > > > > >    #104     fentry_attach_stress:OK
> > > > > > > > >    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > > >
> > > > > > > > > I used loongson3_defconfig and the following additional c=
onfigs:
> > > > > > > > >
> > > > > > > > > CONFIG_KPROBES=3Dy
> > > > > > > > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > > > > > > > > CONFIG_TEST_BPF=3Dm
> > > > > > > > > CONFIG_FTRACE=3Dy
> > > > > > > > > CONFIG_FUNCTION_TRACER=3Dy
> > > > > > > > > CONFIG_DYNAMIC_FTRACE=3Dy
> > > > > > > > > CONFIG_FPROBE=3Dy
> > > > > > > > > CONFIG_FTRACE_SYSCALLS=3Dy
> > > > > > > > > CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> > > > > > > > > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > > > > > > > > CONFIG_DEBUG_INFO_BTF=3Dy
> > > > > > > > > CONFIG_NET_SCH_BPF=3Dy
> > > > > > > > > CONFIG_BPF_LSM=3Dy
> > > > > > > > > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > > > > > > > > CONFIG_ARCH_STRICT_ALIGN=3Dn
> > > > > > > > >
> > > > > > > > > I am not sure whether it is related with configs, you can=
 test it again.
> > > > > > > > >
> > > > > > >
> > > > > > > I did:
> > > > > > >   cp arch/loongarch/configs/loongson3_defconfig .config
> > > > > > >   ./scripts/kconfig/merge_config.sh -y .config config-tiezhu(=
your above config)
> > > > > > > indeed I could not reproduce the lockup, even run the test in=
 a loop.
> > > > > > > it seems to be related to the kernel config I use, maybe you =
could try
> > > > > > > my kernel config?
> > > > > > >
> > > > > > > [root@fedora bpf]# while true; do ./test_progs -a
> > > > > > > fentry_attach_stress; sleep 1; done
> > > > > > > #105     fentry_attach_stress:OK
> > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > #105     fentry_attach_stress:OK
> > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > >
> > > > > > > #105     fentry_attach_stress:OK
> > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > #105     fentry_attach_stress:OK
> > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > #105     fentry_attach_stress:OK
> > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > #105     fentry_attach_stress:OK
> > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > #105     fentry_attach_stress:OK
> > > > > > >
> > > > > >
> > > > > > while checking dmesg with your nolockup config, I see following=
 log:
> > > > > >
> > > > > > [ 3469.410821] Hardware name: Loongson
> > > > > > Loongson-3A6000-7A2000-NUC/Loongson-3A6000-7A2000-NUC, BIOS
> > > > > > Loongson-UDK2018-V4.0.05759-stable202405 07/12/24 15:49:14
> > > > > > [ 3469.410824] pc 90000002456d4880 ra 90000000060885f4 tp
> > > > > > 90000002975d8000 sp 90000002975dbc10
> > > > > > [ 3469.410826] a0 0000000000000000 a1 ffff8000128f0048 a2
> > > > > > 00007ffff1c02638 a3 0000000000000000
> > > > > > [ 3469.410828] a4 00007ffff1c02680 a5 00007ffff0ce0f20 a6
> > > > > > 00007ffff0ce0f20 a7 0000000000000118
> > > > > > [ 3469.410830] t0 ffff80000338dd44 t1 90000002456d4880 t2
> > > > > > d665bdcea9f14eb9 t3 90000001dc9c1000
> > > > > > [ 3469.410832] t4 90000001dea99670 t5 0000000000000000 t6
> > > > > > 0000000000000000 t7 0000000000000000
> > > > > > [ 3469.410834] t8 000000000000000f u0 000000000000000a s9
> > > > > > 90000002975dbec0 s0 90000002975dbc70
> > > > > > [ 3469.410836] s1 0000000000000000 s2 90000000076a5000 s3
> > > > > > 0000000000000000 s4 ffff8000128f0000
> > > > > > [ 3469.410838] s5 0000000000000000 s6 0000000000000000 s7
> > > > > > 0000000000000050 s8 fffffffffffffdf4
> > > > > > [ 3469.410840]    ra: 90000000060885f4 __bpf_prog_test_run_raw_=
tp+0x6c/0x108
> > > > > > [ 3469.410848]   ERA: 90000002456d4880 0x90000002456d4880
> > > > > > [ 3469.410851]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=
=3DCC -WE)
> > > > > > [ 3469.410860]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > > > > [ 3469.410865]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> > > > > > [ 3469.410870]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> > > > > > [ 3469.410875] ESTAT: 000d0000 [INE] (IS=3D ECode=3D13 EsubCode=
=3D0)
> > > > > > [ 3469.410878]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000=
)
> > > > > > [ 3469.410880] Modules linked in: bpf_testmod(O) tls nft_fib_in=
et
> > > > > > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv=
4
> > > > > > nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntr=
ack
> > > > > > nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink cmac
> > > > > > algif_hash algif_skcipher af_alg bnep vfat fat rtw88_8821ce
> > > > > > rtw88_8821c rtw88_pci rtw88_core mac80211 btusb libarc4 btrtl b=
tbcm
> > > > > > btmtk btintel cfg80211 bluetooth sha3_generic kvm jitterentropy=
_rng
> > > > > > drbg ecdh_generic ecc loongson3_cpufreq spi_loongson_pci rfkill
> > > > > > spi_loongson_core uio_pdrv_genirq uio lm75 fuse efi_pstore psto=
re zram
> > > > > > 842_decompress 842_compress lz4hc_compress lz4_compress uas
> > > > > > usb_storage efivarfs [last unloaded: bpf_testmod(O)]
> > > > > > [ 3469.410946] Process test_progs (pid: 37338,
> > > > > > threadinfo=3D00000000760120b6, task=3D00000000620daecd)
> > > > > > [ 3469.410950] Stack : 0000000000000000 0000000000000000
> > > > > > 0000000000000000 d665bdcea9f14eb9
> > > > > > [ 3469.410956]         000000000000000f 0000000000000000
> > > > > > 90000002975dbc70 90000000076a5000
> > > > > > [ 3469.410961]         00007ffff1c02638 ffff8000128f0000
> > > > > > 90000002975dbd90 900000000608ab28
> > > > > > [ 3469.410966]         ffff8000128f0000 0000000000000000
> > > > > > 0000000000000000 d665bdcea9f14eb9
> > > > > > [ 3469.410971]         0000000000000000 90000000076a5000
> > > > > > 90000002975dbd90 00007ffff1c02638
> > > > > > [ 3469.410976]         0000000000000000 000000000000000a
> > > > > > ffff8000128f0000 9000000004f21328
> > > > > > [ 3469.410981]         0000000000000000 9000000004e554c0
> > > > > > 0000000000000000 900000010f6a4240
> > > > > > [ 3469.410986]         0000000129e18000 ffffffff00003500
> > > > > > 0000000000000000 0000000000000000
> > > > > > [ 3469.410990]         0000000000000000 0000000000000000
> > > > > > 0000000000000000 d665bdcea9f14eb9
> > > > > > [ 3469.410995]         0000000000000001 00007ffff1c03040
> > > > > > 0000000000000000 0000000000000002
> > > > > > [ 3469.411000]         ...
> > > > > > [ 3469.411002] Call Trace:
> > > > > > [ 3469.411005] [<9000000004d11fb8>] handle_syscall+0xb8/0x158
> > > > > >
> > > > > > [ 3469.411012] Code: 4c2e0031  31465341  00323731 <00000000> 00=
000000
> > > > > > 975d8000  90000002  00000003  00402040
> > > > > >
> > > > > > [ 3469.411024] ---[ end trace 0000000000000000 ]---
> > > > > >
> > > > > > here is the relevant config diff between your nolockup config a=
nd my
> > > > > > lockup config that I suspect your nolockup config didn't cause =
kernel
> > > > > > lockup
> > > > > >
> > > > > > diff -u config-nolockup config-lockup
> > > > > >
> > > > > > # Debug Oops, Lockups and Hangs
> > > > > >  #
> > > > > > -# CONFIG_PANIC_ON_OOPS is not set
> > > > > > -CONFIG_PANIC_ON_OOPS_VALUE=3D0
> > > > > > +CONFIG_PANIC_ON_OOPS=3Dy
> > > > > > +CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > > > > >  CONFIG_PANIC_TIMEOUT=3D0
> > > > > > -# CONFIG_SOFTLOCKUP_DETECTOR is not set
> > > > > > +CONFIG_LOCKUP_DETECTOR=3Dy
> > > > > > +CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > > > > > +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> > > > > >  CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > > > > > -# CONFIG_HARDLOCKUP_DETECTOR is not set
> > > > > > -# CONFIG_DETECT_HUNG_TASK is not set
> > > > > > -# CONFIG_WQ_WATCHDOG is not set
> > > > > > -# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
> > > > > > +CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > > > > > +# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
> > > > > > +CONFIG_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > > > > > +# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
> > > > > > +CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=3Dy
> > > > > > +CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> > > > > > +CONFIG_DETECT_HUNG_TASK=3Dy
> > > > > > +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> > > > > > +CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> > > > > > +CONFIG_DETECT_HUNG_TASK_BLOCKER=3Dy
> > > > > > +CONFIG_WQ_WATCHDOG=3Dy
> > > > > > +CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> > > > > >  # CONFIG_TEST_LOCKUP is not set
> > > > > >  # end of Debug Oops, Lockups and Hangs
> > > > > Hi, Vincent,
> > > > >
> > > > > I have applied all BPF patches with some small modifications. Can=
 you
> > > > > test it again?
> > > > > https://web.git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/li=
nux-loongson.git/log/?h=3Dloongarch-next
> > > > >
> > > > > Huacai
> > > > >
> > > > I see you applied the tail call bug patches, I thought about applyi=
ng
> > > > tail call patches just in case, but I am not sure the
> > > > fentry_attach_stress involves tail call count bugs. I tried your
> > > > loongarch-next branch anyway, but the lockup still happens when I r=
un
> > > > fentry_attach_stress in a while loop. I am not sure if this particu=
lar
> > > > test should block the merge of bpf trampoline patches, it looks to =
be
> > > > an extreme and rare case, maybe track it as a bug report and fix it
> > > > later after merge? just my two cents :)
> > > >
> > > > [root@fedora ~]# cd /usr/src/linux-loongson/
> > > > [root@fedora linux-loongson]# git branch
> > > > * loongarch-next
> > > >   master
> > > > [root@fedora linux-loongson]# uname -a
> > > > Linux fedora 6.16.0+ #1 SMP PREEMPT_DYNAMIC Sun Aug  3 08:01:34 PDT
> > > > 2025 loongarch64 GNU/Linux
> > > >
> > > > [root@fedora linux-loongson]# cd tools/testing/selftests/bpf/
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > #107     fentry_attach_stress:OK
> > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > >
> > > > [root@fedora bpf]# while true; do ./test_progs -a
> > > > fentry_attach_stress; sleep 5; done
> > > > client_loop: send disconnect: Broken pipe
> > > Could you please try this on top of loongarch-next?
> > > diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/ins=
t.c
> > > index e61c482068fe..c63c78a99f99 100644
> > > --- a/arch/loongarch/kernel/inst.c
> > > +++ b/arch/loongarch/kernel/inst.c
> > > @@ -5,6 +5,7 @@
> > >  #include <linux/sizes.h>
> > >  #include <linux/uaccess.h>
> > >  #include <linux/set_memory.h>
> > > +#include <linux/stop_machine.h>
> > >
> > >  #include <asm/cacheflush.h>
> > >  #include <asm/inst.h>
> > > @@ -219,32 +220,49 @@ int larch_insn_patch_text(void *addr, u32 insn)
> > >         return ret;
> > >  }
> > >
> > > -int larch_insn_text_copy(void *dst, void *src, size_t len)
> > > +struct insn_copy {
> > > +       void *dst;
> > > +       void *src;
> > > +       size_t len;
> > > +       unsigned int cpu;
> > > +};
> > > +
> > > +static int text_copy_cb(void *data)
> > >  {
> > > -       int ret;
> > > -       unsigned long flags;
> > > -       unsigned long dst_start, dst_end, dst_len;
> > > +       int ret =3D 0;
> > > +       size_t start, end;
> > > +       struct insn_copy *copy =3D data;
> > >
> > > -       dst_start =3D round_down((unsigned long)dst, PAGE_SIZE);
> > > -       dst_end =3D round_up((unsigned long)dst + len, PAGE_SIZE);
> > > -       dst_len =3D dst_end - dst_start;  /* page-aligned */
> > > +       if (smp_processor_id() =3D=3D copy->cpu) {
> > > +               start =3D round_down((size_t)copy->dst, PAGE_SIZE);
> > > +               end   =3D round_up((size_t)copy->dst + copy->len, PAG=
E_SIZE);
> > >
> > > -       set_memory_rw(dst_start, dst_len / PAGE_SIZE);
> > > -       raw_spin_lock_irqsave(&patch_lock, flags);
> > > +               set_memory_rw(start, (end - start) / PAGE_SIZE);
> > >
> > > -       ret =3D copy_to_kernel_nofault(dst, src, len);
> > > -       if (ret)
> > > -               pr_err("%s: operation failed\n", __func__);
> > > +               ret =3D copy_to_kernel_nofault(copy->dst, copy->src, =
copy->len);
> > > +               if (ret)
> > > +                       pr_err("%s: operation failed\n", __func__);
> > >
> > > -       raw_spin_unlock_irqrestore(&patch_lock, flags);
> > > -       set_memory_rox(dst_start, dst_len / PAGE_SIZE);
> > > +               set_memory_rox(start, (end - start) / PAGE_SIZE);
> > > +       }
> > >
> > > -       if (!ret)
> > > -               flush_icache_range((unsigned long)dst, (unsigned
> > > long)dst + len);
> > > +       flush_icache_range((unsigned long)copy->dst, (unsigned
> > > long)copy->dst + copy->len);
> > >
> > >         return ret;
> > >  }
> > >
> > > +int larch_insn_text_copy(void *dst, void *src, size_t len)
> > > +{
> > > +       struct insn_copy copy =3D {
> > > +               .dst =3D dst,
> > > +               .src =3D src,
> > > +               .len =3D len,
> > > +               .cpu =3D smp_processor_id(),
> > > +       };
> > > +
> > > +       return stop_machine_cpuslocked(text_copy_cb, &copy, cpu_onlin=
e_mask);
> > > +}
> > > +
> > >  u32 larch_insn_gen_nop(void)
> > >  {
> > >         return INSN_NOP;
> > >
> > Here is the result code I manually patched according to the above
> > diff. unfortunately, it made the lockup issue worse, even with
> > Tiezhu's no lockup config, it locked up immediately when start
> > fentry_attach_stress
> >
> > struct insn_copy {
> >        void *dst;
> >        void *src;
> >        size_t len;
> >        unsigned int cpu;
> > };
> >
> > static int text_copy_cb(void *data)
> > {
> >        int ret =3D 0;
> >        size_t start, end;
> >        struct insn_copy *copy =3D data;
> >
> >        if (smp_processor_id() =3D=3D copy->cpu) {
> >                start =3D round_down((size_t)copy->dst, PAGE_SIZE);
> >                end   =3D round_up((size_t)copy->dst + copy->len, PAGE_S=
IZE);
> >                set_memory_rw(start, (end - start) / PAGE_SIZE);
> >                ret =3D copy_to_kernel_nofault(copy->dst, copy->src, cop=
y->len);
> >                if (ret)
> >                        pr_err("%s: operation failed\n", __func__);
> >
> >                set_memory_rox(start, (end - start) / PAGE_SIZE);
> >        }
> >
> >        flush_icache_range((unsigned long)copy->dst, (unsigned
> > long)copy->dst + copy->len);
> >
> >         return ret;
> > }
> >
> > int larch_insn_text_copy(void *dst, void *src, size_t len)
> > {
> >        struct insn_copy copy =3D {
> >                .dst =3D dst,
> >                .src =3D src,
> >                .len =3D len,
> >                .cpu =3D smp_processor_id(),
> >        };
> >
> >        return stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_m=
ask);
> > }
> >
> Huacai,
>
> Here is your second revision  code that is tested so far working well,
> with Tiezhu's kernel config, no lockup running fentry_attach_stress in
> while loop, no dmesg kernel panic trace, other fentry*/fexit* also
> past.  I am going to do clean kernel build with my kernel config with
> softlockup/hardlockup detection on, and will report result ASAP
>
all test looks good with kernel with softlock/hardlock detection on

[root@fedora bpf]# while true; do  ./test_progs -a
fentry_attach_stress; sleep 1; done
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
#107     fentry_attach_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
^C
[root@fedora bpf]# ./test_progs -a fexit_bpf2bpf
#110/1   fexit_bpf2bpf/target_no_callees:OK
#110/2   fexit_bpf2bpf/target_yes_callees:OK
#110/3   fexit_bpf2bpf/func_replace:OK
#110/4   fexit_bpf2bpf/func_replace_verify:OK
#110/5   fexit_bpf2bpf/func_sockmap_update:OK
#110/6   fexit_bpf2bpf/func_replace_return_code:OK
#110/7   fexit_bpf2bpf/func_map_prog_compatibility:OK
#110/8   fexit_bpf2bpf/func_replace_unreliable:OK
#110/9   fexit_bpf2bpf/func_replace_multi:OK
#110/10  fexit_bpf2bpf/fmod_ret_freplace:OK
#110/11  fexit_bpf2bpf/func_replace_global_func:OK
(cgroup_helpers.c:101: errno: Invalid argument) Enabling controller
cpu: /mnt/cgroup.subtree_control
#110 fexit_bpf2bpf: Failed to setup cgroup environment
test_fentry_to_cgroup_bpf:FAIL:cgroup_fd unexpected cgroup_fd: actual
-1 < expected 0
#110/12  fexit_bpf2bpf/fentry_to_cgroup_bpf:FAIL
#110/13  fexit_bpf2bpf/func_replace_progmap:OK
#110     fexit_bpf2bpf:FAIL

All error logs:
(cgroup_helpers.c:101: errno: Invalid argument) Enabling controller
cpu: /mnt/cgroup.subtree_control
#110 fexit_bpf2bpf: Failed to setup cgroup environment
test_fentry_to_cgroup_bpf:FAIL:cgroup_fd unexpected cgroup_fd: actual
-1 < expected 0
#110/12  fexit_bpf2bpf/fentry_to_cgroup_bpf:FAIL
#110     fexit_bpf2bpf:FAIL
Summary: 0/12 PASSED, 0 SKIPPED, 1 FAILED
[root@fedora bpf]# ./test_progs -a fentry_fexit
#108     fentry_fexit:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fentry_test
#109/1   fentry_test/fentry:OK
fentry_many_args:PASS:fentry_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fentry_many_args:FAIL:fentry_many_args_attach unexpected error: -524 (errno=
 524)
#109/2   fentry_test/fentry_many_args:FAIL
#109     fentry_test:FAIL

All error logs:
fentry_many_args:PASS:fentry_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fentry_many_args:FAIL:fentry_many_args_attach unexpected error: -524 (errno=
 524)
#109/2   fentry_test/fentry_many_args:FAIL
#109     fentry_test:FAIL
Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED
[root@fedora bpf]# ./test_progs -a fentry_attach_btf_presence
#106     fentry_attach_btf_presence:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fexit_noreturns
Summary: 0/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fexit_sleep
#111     fexit_sleep:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fexit_stress
#112     fexit_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fexit_test
#113/1   fexit_test/fexit:OK
fexit_many_args:PASS:fexit_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fexit_many_args:FAIL:fexit_many_args_attach unexpected error: -524 (errno 5=
24)
#113/2   fexit_test/fexit_many_args:FAIL
#113     fexit_test:FAIL

All error logs:
fexit_many_args:PASS:fexit_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fexit_many_args:FAIL:fexit_many_args_attach unexpected error: -524 (errno 5=
24)
#113/2   fexit_test/fexit_many_args:FAIL
#113     fexit_test:FAIL
Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED

[root@fedora linux-loongson]# xdp-loader status
CURRENT XDP PROGRAM STATUS:

Interface        Prio  Program name      Mode     ID   Tag
  Chain actions
---------------------------------------------------------------------------=
-----------
lo                     xdp_dispatcher    skb      74280 4d7e87c0d30db711
 =3D>              10     xdpfilt_alw_all           74289
320c53c06933a8fa  XDP_PASS
dummy0                 <No XDP program loaded!>


> struct insn_copy {
>        void *dst;
>        void *src;
>        size_t len;
>        unsigned int cpu;
> };
>
> static int text_copy_cb(void *data)
> {
>        int ret =3D 0;
>        struct insn_copy *copy =3D data;
>
>        if (smp_processor_id() =3D=3D copy->cpu) {
>                ret =3D copy_to_kernel_nofault(copy->dst, copy->src, copy-=
>len);
>                if (ret)
>                        pr_err("%s: operation failed\n", __func__);
>
>        }
>
>        flush_icache_range((unsigned long)copy->dst, (unsigned
> long)copy->dst + copy->len);
>
>        return ret;
> }
>
> int larch_insn_text_copy(void *dst, void *src, size_t len)
> {
>        int ret =3D 0;
>        size_t start, end;
>        struct insn_copy copy =3D {
>                .dst =3D dst,
>                .src =3D src,
>                .len =3D len,
>                .cpu =3D smp_processor_id(),
>        };
>
>        start =3D round_down((size_t)dst, PAGE_SIZE);
>        end   =3D round_up((size_t)dst + len, PAGE_SIZE);
>
>        set_memory_rw(start, (end - start) / PAGE_SIZE);
>        return stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_mas=
k);
>        set_memory_rox(start, (end - start) / PAGE_SIZE);
>
>        return ret;
> }
>
> >
> > > >
> > > > > >
> > > > > > > >
> > > > > > > > Have you tried to run the same  fentry_attach_stress multip=
le times or
> > > > > > > > in a loop like while true; do ./test_progs -a fentry_attach=
_stress;
> > > > > > > > sleep 1; done
> > > > > > > > the lockup happens intermittently, sometime it PASSED, some=
time kernel
> > > > > > > > locks up. I merged the tools/testing/selftests/bpf/config w=
ith my
> > > > > > > > original config by
> > > > > > > > ./scripts/kconfig/merge_config.sh -y .config
> > > > > > > > tools/testing/selftests/bpf/config. my config seems includi=
ng
> > > > > > > > everything  you listed above except CONFIG_ARCH_STRICT_ALIG=
N not set,
> > > > > > > > here is my config https://www.bpfire.net/download/loongfire=
/config.txt
> > > > > > > >
> > > > > > > > > Thanks,
> > > > > > > > > Tiezhu
> > > > > > > > >
