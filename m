Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24716271A6F
	for <loongarch@lists.linux.dev>; Mon,  4 Aug 2025 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322682; cv=none; b=SiE7fOCV74X0JBiIiAeUY6aGkNjgmQFxWb8rhT/5DiLFoDkmt4rGT2af7+/I2uFXfuJrn4mFsEoD0YpTVd6Jr+4UokggGpermyB0QtZDIDHDuqBm5NqciRbsoB0umeXjvcZWBLaDcBJ9zA/2K6lIrr5K0PsWfVwsbG7EoHOXYW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322682; c=relaxed/simple;
	bh=1SEbxRbFOwpty+7Q8vDdSoPHG/u0//+nAhCwGaokVfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+IhumSYbWWs8iav1TOTsdJhNHU+W2SfFo7zTCsuB/EP+u/7t2227Y9JTS9ujcn0QaVVW8P/mcptoyKUG1xVntnmzw5AjhiZ9x2CuyumP9f6jfCZ9pNMdLd1Dmj4kVh+68Uc6eicGcrNo4PrlZ2ywloT7RZBP/DqxsJc/BX32pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aChZBTRS; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aChZBTRS"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b078384dcfso3511811cf.0
        for <loongarch@lists.linux.dev>; Mon, 04 Aug 2025 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322679; x=1754927479; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO6WMpsE1VWDUiHSC6eAAeaHumQMnfqDBr9xnE0gAAQ=;
        b=aChZBTRS+F13fgAJfCL5QpdjgG9TkRu44F5dsueGveP4z0aHpOPqzFJFaZ4GPhgOl9
         OvRsZCqcc+uQK3uyEU35H6zGQ3xpSu6tLyYGytBpvjPyy6UcGzzdKZYAJbAKwAmdmQRB
         k4VtRezW0FU2BLjDQwej7YuNNsn83tQ/NQb2gIVA53nmrB4wWotjvo7Ng6f4o2+3buB2
         3tc/Y6LHx1Rx1bkbRjhlutYXIf2LeqnVPqXVjltdW/yYhX7tIQp1JPkobinDjk6BJHfJ
         V8abfFbFAfAXFWtHuAHJnNHBdiexmIGIX3OYIW1WnJikmt2igaLckLsZpyFi1J+g6uMV
         1RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322679; x=1754927479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VO6WMpsE1VWDUiHSC6eAAeaHumQMnfqDBr9xnE0gAAQ=;
        b=Ni2C7vkq/RIiZf8P8slyBXzY46vJB9O86LxDpg66DpqFCbB/4/HyjmTXxK4fJ1hFCD
         /Qt+kU/7zPRp5vLf+U3xDmfdVgnPsFwKohWD6vTtMCHau5uM6T7RtafR2ikEcrZ1Bx+e
         4eOlyC+ZfNUfEoh75aEhcmwS1ra8egnbTHXnFrOiALO38wW02+6wUOzxZNkljuTz2eQ5
         uFXvxfcDdQ09HDflqHph0Fl7XzxwZAbaOTHhy3JYhwgV2CQ1UU2KRvEx4+wQ+/CVZjam
         C0iCAITOmQz8q23p99lAQqHMkNWTzMfiBQRpY1/jOQK1DS1woxkfcpDJTRoo4CtR/OsL
         L8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGVjSJfjC58113FYMx0u3GXTBlhSWL9CjB9abG/knKk4l5zh2IKLMKVTnJQZCGCTudQdRyYRacXKA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+bWCj/X2/EDSyhocfF6AEmkO0M0YmpD6m1nkokv+YXWj9wjU2
	7A16Zfhbz/5W8hpM5xa0FMMzUDZSH5kX83EvEevmiLg4CXWTbc/nlAv1jMCQSUsp1TpaazzHErU
	npHn46M4Vqdpo1qPcRmu1J83B7puDDXM=
X-Gm-Gg: ASbGncti59vF+j70H6GNgkJtm43hk9y5vxEf7awlk6Y65S+AOkPbfkqgqtGTLZJNi9A
	EfdybfapUUCFQ7CIE1JneAo9dontN8sswg+zGcpfJ/u2UljVopNZP28LJj01L+IZWcP3gEwjWqk
	WYwQpu2Ow2aOsn6WxEjurpN8CZoU4TFgHG1KRa7eE6E/9tJhYIFmhOYNhSy07fRxdFDi2mR72Br
	K4MnVQ=
X-Google-Smtp-Source: AGHT+IHXwDaqWSN3v140Hrf1Fchmd85FZX7nOOLfDGOuW1Yt69k/ysKj9V5eWiwtHbUMZZLgen3FUUHNvXCNbipE0Bo=
X-Received: by 2002:a05:622a:4b13:b0:4b0:710d:3cbd with SMTP id
 d75a77b69052e-4b0710d3f53mr52384541cf.7.1754322678403; Mon, 04 Aug 2025
 08:51:18 -0700 (PDT)
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
 <CAK3+h2zdoAtiyUiVhiTROh2t7JDroCCPTcJ79+XB_hEBTUWvnA@mail.gmail.com>
 <CAK3+h2x0dTxXOLKngBc-Yx_VW86T=v1VW8RAAw3mEbioAEBueA@mail.gmail.com> <CAK3+h2ygTjy7qiBRvL1ct309gKtCzG3_G8nrJ49PQUtXtKDwxg@mail.gmail.com>
In-Reply-To: <CAK3+h2ygTjy7qiBRvL1ct309gKtCzG3_G8nrJ49PQUtXtKDwxg@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 4 Aug 2025 08:51:07 -0700
X-Gm-Features: Ac12FXxaXXAvVecpFqzaCoSNu0yrdwvxpfcYAvMUqID4SRnTayPkzqchNSJJ4VA
Message-ID: <CAK3+h2wbfnJ6J8e0O5oUL8Ob2r9Nd9pLhz8+C9eBhYG8zhT-cQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	hengqi.chen@gmail.com, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 8:36=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> On Mon, Aug 4, 2025 at 7:24=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > On Mon, Aug 4, 2025 at 6:28=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.=
com> wrote:
> > >
> > > On Mon, Aug 4, 2025 at 1:24=E2=80=AFAM Huacai Chen <chenhuacai@kernel=
.org> wrote:
> > > >
> > > > On Sun, Aug 3, 2025 at 11:25=E2=80=AFPM Vincent Li <vincent.mc.li@g=
mail.com> wrote:
> > > > >
> > > > > On Sun, Aug 3, 2025 at 7:11=E2=80=AFAM Huacai Chen <chenhuacai@ke=
rnel.org> wrote:
> > > > > >
> > > > > > On Sat, Aug 2, 2025 at 11:52=E2=80=AFPM Vincent Li <vincent.mc.=
li@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, Aug 2, 2025 at 7:47=E2=80=AFAM Vincent Li <vincent.mc=
.li@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Sat, Aug 2, 2025 at 6:53=E2=80=AFAM Vincent Li <vincent.=
mc.li@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Sat, Aug 2, 2025 at 2:19=E2=80=AFAM Tiezhu Yang <yangt=
iezhu@loongson.cn> wrote:
> > > > > > > > > >
> > > > > > > > > > On 2025/8/1 =E4=B8=8B=E5=8D=881:21, Vincent Li wrote:
> > > > > > > > > > > Hi Chenghao,
> > > > > > > > > > >
> > > > > > > > > > > I trimmed the email recipients only to the loongarch =
mailing list and
> > > > > > > > > > > folks who might pay attention to this, I personally d=
on't like to
> > > > > > > > > > > bother other people who may not be interested in this=
 :). Folks let me
> > > > > > > > > > > know if this  is not ok. anyway, please check my bpf =
selftest result
> > > > > > > > > > > inline.  The fentry_attach_stress results in kernel l=
ockup.
> > > > > > > > > >
> > > > > > > > > > It passed on my test environment.
> > > > > > > > > >
> > > > > > > > > >    $ sudo ./test_progs -a fentry_attach_stress
> > > > > > > > > >    #104     fentry_attach_stress:OK
> > > > > > > > > >    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > > > >
> > > > > > > > > > I used loongson3_defconfig and the following additional=
 configs:
> > > > > > > > > >
> > > > > > > > > > CONFIG_KPROBES=3Dy
> > > > > > > > > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > > > > > > > > > CONFIG_TEST_BPF=3Dm
> > > > > > > > > > CONFIG_FTRACE=3Dy
> > > > > > > > > > CONFIG_FUNCTION_TRACER=3Dy
> > > > > > > > > > CONFIG_DYNAMIC_FTRACE=3Dy
> > > > > > > > > > CONFIG_FPROBE=3Dy
> > > > > > > > > > CONFIG_FTRACE_SYSCALLS=3Dy
> > > > > > > > > > CONFIG_BPF_KPROBE_OVERRIDE=3Dy
> > > > > > > > > > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > > > > > > > > > CONFIG_DEBUG_INFO_BTF=3Dy
> > > > > > > > > > CONFIG_NET_SCH_BPF=3Dy
> > > > > > > > > > CONFIG_BPF_LSM=3Dy
> > > > > > > > > > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > > > > > > > > > CONFIG_ARCH_STRICT_ALIGN=3Dn
> > > > > > > > > >
> > > > > > > > > > I am not sure whether it is related with configs, you c=
an test it again.
> > > > > > > > > >
> > > > > > > >
> > > > > > > > I did:
> > > > > > > >   cp arch/loongarch/configs/loongson3_defconfig .config
> > > > > > > >   ./scripts/kconfig/merge_config.sh -y .config config-tiezh=
u(your above config)
> > > > > > > > indeed I could not reproduce the lockup, even run the test =
in a loop.
> > > > > > > > it seems to be related to the kernel config I use, maybe yo=
u could try
> > > > > > > > my kernel config?
> > > > > > > >
> > > > > > > > [root@fedora bpf]# while true; do ./test_progs -a
> > > > > > > > fentry_attach_stress; sleep 1; done
> > > > > > > > #105     fentry_attach_stress:OK
> > > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > > #105     fentry_attach_stress:OK
> > > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > >
> > > > > > > > #105     fentry_attach_stress:OK
> > > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > > #105     fentry_attach_stress:OK
> > > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > > #105     fentry_attach_stress:OK
> > > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > > #105     fentry_attach_stress:OK
> > > > > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > > > > #105     fentry_attach_stress:OK
> > > > > > > >
> > > > > > >
> > > > > > > while checking dmesg with your nolockup config, I see followi=
ng log:
> > > > > > >
> > > > > > > [ 3469.410821] Hardware name: Loongson
> > > > > > > Loongson-3A6000-7A2000-NUC/Loongson-3A6000-7A2000-NUC, BIOS
> > > > > > > Loongson-UDK2018-V4.0.05759-stable202405 07/12/24 15:49:14
> > > > > > > [ 3469.410824] pc 90000002456d4880 ra 90000000060885f4 tp
> > > > > > > 90000002975d8000 sp 90000002975dbc10
> > > > > > > [ 3469.410826] a0 0000000000000000 a1 ffff8000128f0048 a2
> > > > > > > 00007ffff1c02638 a3 0000000000000000
> > > > > > > [ 3469.410828] a4 00007ffff1c02680 a5 00007ffff0ce0f20 a6
> > > > > > > 00007ffff0ce0f20 a7 0000000000000118
> > > > > > > [ 3469.410830] t0 ffff80000338dd44 t1 90000002456d4880 t2
> > > > > > > d665bdcea9f14eb9 t3 90000001dc9c1000
> > > > > > > [ 3469.410832] t4 90000001dea99670 t5 0000000000000000 t6
> > > > > > > 0000000000000000 t7 0000000000000000
> > > > > > > [ 3469.410834] t8 000000000000000f u0 000000000000000a s9
> > > > > > > 90000002975dbec0 s0 90000002975dbc70
> > > > > > > [ 3469.410836] s1 0000000000000000 s2 90000000076a5000 s3
> > > > > > > 0000000000000000 s4 ffff8000128f0000
> > > > > > > [ 3469.410838] s5 0000000000000000 s6 0000000000000000 s7
> > > > > > > 0000000000000050 s8 fffffffffffffdf4
> > > > > > > [ 3469.410840]    ra: 90000000060885f4 __bpf_prog_test_run_ra=
w_tp+0x6c/0x108
> > > > > > > [ 3469.410848]   ERA: 90000002456d4880 0x90000002456d4880
> > > > > > > [ 3469.410851]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DA=
CM=3DCC -WE)
> > > > > > > [ 3469.410860]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > > > > > [ 3469.410865]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
> > > > > > > [ 3469.410870]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> > > > > > > [ 3469.410875] ESTAT: 000d0000 [INE] (IS=3D ECode=3D13 EsubCo=
de=3D0)
> > > > > > > [ 3469.410878]  PRID: 0014d000 (Loongson-64bit, Loongson-3A60=
00)
> > > > > > > [ 3469.410880] Modules linked in: bpf_testmod(O) tls nft_fib_=
inet
> > > > > > > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_i=
pv4
> > > > > > > nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conn=
track
> > > > > > > nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink cmac
> > > > > > > algif_hash algif_skcipher af_alg bnep vfat fat rtw88_8821ce
> > > > > > > rtw88_8821c rtw88_pci rtw88_core mac80211 btusb libarc4 btrtl=
 btbcm
> > > > > > > btmtk btintel cfg80211 bluetooth sha3_generic kvm jitterentro=
py_rng
> > > > > > > drbg ecdh_generic ecc loongson3_cpufreq spi_loongson_pci rfki=
ll
> > > > > > > spi_loongson_core uio_pdrv_genirq uio lm75 fuse efi_pstore ps=
tore zram
> > > > > > > 842_decompress 842_compress lz4hc_compress lz4_compress uas
> > > > > > > usb_storage efivarfs [last unloaded: bpf_testmod(O)]
> > > > > > > [ 3469.410946] Process test_progs (pid: 37338,
> > > > > > > threadinfo=3D00000000760120b6, task=3D00000000620daecd)
> > > > > > > [ 3469.410950] Stack : 0000000000000000 0000000000000000
> > > > > > > 0000000000000000 d665bdcea9f14eb9
> > > > > > > [ 3469.410956]         000000000000000f 0000000000000000
> > > > > > > 90000002975dbc70 90000000076a5000
> > > > > > > [ 3469.410961]         00007ffff1c02638 ffff8000128f0000
> > > > > > > 90000002975dbd90 900000000608ab28
> > > > > > > [ 3469.410966]         ffff8000128f0000 0000000000000000
> > > > > > > 0000000000000000 d665bdcea9f14eb9
> > > > > > > [ 3469.410971]         0000000000000000 90000000076a5000
> > > > > > > 90000002975dbd90 00007ffff1c02638
> > > > > > > [ 3469.410976]         0000000000000000 000000000000000a
> > > > > > > ffff8000128f0000 9000000004f21328
> > > > > > > [ 3469.410981]         0000000000000000 9000000004e554c0
> > > > > > > 0000000000000000 900000010f6a4240
> > > > > > > [ 3469.410986]         0000000129e18000 ffffffff00003500
> > > > > > > 0000000000000000 0000000000000000
> > > > > > > [ 3469.410990]         0000000000000000 0000000000000000
> > > > > > > 0000000000000000 d665bdcea9f14eb9
> > > > > > > [ 3469.410995]         0000000000000001 00007ffff1c03040
> > > > > > > 0000000000000000 0000000000000002
> > > > > > > [ 3469.411000]         ...
> > > > > > > [ 3469.411002] Call Trace:
> > > > > > > [ 3469.411005] [<9000000004d11fb8>] handle_syscall+0xb8/0x158
> > > > > > >
> > > > > > > [ 3469.411012] Code: 4c2e0031  31465341  00323731 <00000000> =
00000000
> > > > > > > 975d8000  90000002  00000003  00402040
> > > > > > >
> > > > > > > [ 3469.411024] ---[ end trace 0000000000000000 ]---
> > > > > > >
> > > > > > > here is the relevant config diff between your nolockup config=
 and my
> > > > > > > lockup config that I suspect your nolockup config didn't caus=
e kernel
> > > > > > > lockup
> > > > > > >
> > > > > > > diff -u config-nolockup config-lockup
> > > > > > >
> > > > > > > # Debug Oops, Lockups and Hangs
> > > > > > >  #
> > > > > > > -# CONFIG_PANIC_ON_OOPS is not set
> > > > > > > -CONFIG_PANIC_ON_OOPS_VALUE=3D0
> > > > > > > +CONFIG_PANIC_ON_OOPS=3Dy
> > > > > > > +CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > > > > > >  CONFIG_PANIC_TIMEOUT=3D0
> > > > > > > -# CONFIG_SOFTLOCKUP_DETECTOR is not set
> > > > > > > +CONFIG_LOCKUP_DETECTOR=3Dy
> > > > > > > +CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > > > > > > +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> > > > > > >  CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > > > > > > -# CONFIG_HARDLOCKUP_DETECTOR is not set
> > > > > > > -# CONFIG_DETECT_HUNG_TASK is not set
> > > > > > > -# CONFIG_WQ_WATCHDOG is not set
> > > > > > > -# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
> > > > > > > +CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > > > > > > +# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
> > > > > > > +CONFIG_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> > > > > > > +# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
> > > > > > > +CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=3Dy
> > > > > > > +CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> > > > > > > +CONFIG_DETECT_HUNG_TASK=3Dy
> > > > > > > +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> > > > > > > +CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> > > > > > > +CONFIG_DETECT_HUNG_TASK_BLOCKER=3Dy
> > > > > > > +CONFIG_WQ_WATCHDOG=3Dy
> > > > > > > +CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> > > > > > >  # CONFIG_TEST_LOCKUP is not set
> > > > > > >  # end of Debug Oops, Lockups and Hangs
> > > > > > Hi, Vincent,
> > > > > >
> > > > > > I have applied all BPF patches with some small modifications. C=
an you
> > > > > > test it again?
> > > > > > https://web.git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/=
linux-loongson.git/log/?h=3Dloongarch-next
> > > > > >
> > > > > > Huacai
> > > > > >
> > > > > I see you applied the tail call bug patches, I thought about appl=
ying
> > > > > tail call patches just in case, but I am not sure the
> > > > > fentry_attach_stress involves tail call count bugs. I tried your
> > > > > loongarch-next branch anyway, but the lockup still happens when I=
 run
> > > > > fentry_attach_stress in a while loop. I am not sure if this parti=
cular
> > > > > test should block the merge of bpf trampoline patches, it looks t=
o be
> > > > > an extreme and rare case, maybe track it as a bug report and fix =
it
> > > > > later after merge? just my two cents :)
> > > > >
> > > > > [root@fedora ~]# cd /usr/src/linux-loongson/
> > > > > [root@fedora linux-loongson]# git branch
> > > > > * loongarch-next
> > > > >   master
> > > > > [root@fedora linux-loongson]# uname -a
> > > > > Linux fedora 6.16.0+ #1 SMP PREEMPT_DYNAMIC Sun Aug  3 08:01:34 P=
DT
> > > > > 2025 loongarch64 GNU/Linux
> > > > >
> > > > > [root@fedora linux-loongson]# cd tools/testing/selftests/bpf/
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > [root@fedora bpf]# ./test_progs -a fentry_attach_stress
> > > > > #107     fentry_attach_stress:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > >
> > > > > [root@fedora bpf]# while true; do ./test_progs -a
> > > > > fentry_attach_stress; sleep 5; done
> > > > > client_loop: send disconnect: Broken pipe
> > > > Could you please try this on top of loongarch-next?
> > > > diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/i=
nst.c
> > > > index e61c482068fe..c63c78a99f99 100644
> > > > --- a/arch/loongarch/kernel/inst.c
> > > > +++ b/arch/loongarch/kernel/inst.c
> > > > @@ -5,6 +5,7 @@
> > > >  #include <linux/sizes.h>
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/set_memory.h>
> > > > +#include <linux/stop_machine.h>
> > > >
> > > >  #include <asm/cacheflush.h>
> > > >  #include <asm/inst.h>
> > > > @@ -219,32 +220,49 @@ int larch_insn_patch_text(void *addr, u32 ins=
n)
> > > >         return ret;
> > > >  }
> > > >
> > > > -int larch_insn_text_copy(void *dst, void *src, size_t len)
> > > > +struct insn_copy {
> > > > +       void *dst;
> > > > +       void *src;
> > > > +       size_t len;
> > > > +       unsigned int cpu;
> > > > +};
> > > > +
> > > > +static int text_copy_cb(void *data)
> > > >  {
> > > > -       int ret;
> > > > -       unsigned long flags;
> > > > -       unsigned long dst_start, dst_end, dst_len;
> > > > +       int ret =3D 0;
> > > > +       size_t start, end;
> > > > +       struct insn_copy *copy =3D data;
> > > >
> > > > -       dst_start =3D round_down((unsigned long)dst, PAGE_SIZE);
> > > > -       dst_end =3D round_up((unsigned long)dst + len, PAGE_SIZE);
> > > > -       dst_len =3D dst_end - dst_start;  /* page-aligned */
> > > > +       if (smp_processor_id() =3D=3D copy->cpu) {
> > > > +               start =3D round_down((size_t)copy->dst, PAGE_SIZE);
> > > > +               end   =3D round_up((size_t)copy->dst + copy->len, P=
AGE_SIZE);
> > > >
> > > > -       set_memory_rw(dst_start, dst_len / PAGE_SIZE);
> > > > -       raw_spin_lock_irqsave(&patch_lock, flags);
> > > > +               set_memory_rw(start, (end - start) / PAGE_SIZE);
> > > >
> > > > -       ret =3D copy_to_kernel_nofault(dst, src, len);
> > > > -       if (ret)
> > > > -               pr_err("%s: operation failed\n", __func__);
> > > > +               ret =3D copy_to_kernel_nofault(copy->dst, copy->src=
, copy->len);
> > > > +               if (ret)
> > > > +                       pr_err("%s: operation failed\n", __func__);
> > > >
> > > > -       raw_spin_unlock_irqrestore(&patch_lock, flags);
> > > > -       set_memory_rox(dst_start, dst_len / PAGE_SIZE);
> > > > +               set_memory_rox(start, (end - start) / PAGE_SIZE);
> > > > +       }
> > > >
> > > > -       if (!ret)
> > > > -               flush_icache_range((unsigned long)dst, (unsigned
> > > > long)dst + len);
> > > > +       flush_icache_range((unsigned long)copy->dst, (unsigned
> > > > long)copy->dst + copy->len);
> > > >
> > > >         return ret;
> > > >  }
> > > >
> > > > +int larch_insn_text_copy(void *dst, void *src, size_t len)
> > > > +{
> > > > +       struct insn_copy copy =3D {
> > > > +               .dst =3D dst,
> > > > +               .src =3D src,
> > > > +               .len =3D len,
> > > > +               .cpu =3D smp_processor_id(),
> > > > +       };
> > > > +
> > > > +       return stop_machine_cpuslocked(text_copy_cb, &copy, cpu_onl=
ine_mask);
> > > > +}
> > > > +
> > > >  u32 larch_insn_gen_nop(void)
> > > >  {
> > > >         return INSN_NOP;
> > > >
> > > Here is the result code I manually patched according to the above
> > > diff. unfortunately, it made the lockup issue worse, even with
> > > Tiezhu's no lockup config, it locked up immediately when start
> > > fentry_attach_stress
> > >
> > > struct insn_copy {
> > >        void *dst;
> > >        void *src;
> > >        size_t len;
> > >        unsigned int cpu;
> > > };
> > >
> > > static int text_copy_cb(void *data)
> > > {
> > >        int ret =3D 0;
> > >        size_t start, end;
> > >        struct insn_copy *copy =3D data;
> > >
> > >        if (smp_processor_id() =3D=3D copy->cpu) {
> > >                start =3D round_down((size_t)copy->dst, PAGE_SIZE);
> > >                end   =3D round_up((size_t)copy->dst + copy->len, PAGE=
_SIZE);
> > >                set_memory_rw(start, (end - start) / PAGE_SIZE);
> > >                ret =3D copy_to_kernel_nofault(copy->dst, copy->src, c=
opy->len);
> > >                if (ret)
> > >                        pr_err("%s: operation failed\n", __func__);
> > >
> > >                set_memory_rox(start, (end - start) / PAGE_SIZE);
> > >        }
> > >
> > >        flush_icache_range((unsigned long)copy->dst, (unsigned
> > > long)copy->dst + copy->len);
> > >
> > >         return ret;
> > > }
> > >
> > > int larch_insn_text_copy(void *dst, void *src, size_t len)
> > > {
> > >        struct insn_copy copy =3D {
> > >                .dst =3D dst,
> > >                .src =3D src,
> > >                .len =3D len,
> > >                .cpu =3D smp_processor_id(),
> > >        };
> > >
> > >        return stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online=
_mask);
> > > }
> > >
> > Huacai,
> >
> > Here is your second revision  code that is tested so far working well,
> > with Tiezhu's kernel config, no lockup running fentry_attach_stress in
> > while loop, no dmesg kernel panic trace, other fentry*/fexit* also
> > past.  I am going to do clean kernel build with my kernel config with
> > softlockup/hardlockup detection on, and will report result ASAP
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
> >        struct insn_copy *copy =3D data;
> >
> >        if (smp_processor_id() =3D=3D copy->cpu) {
> >                ret =3D copy_to_kernel_nofault(copy->dst, copy->src, cop=
y->len);
> >                if (ret)
> >                        pr_err("%s: operation failed\n", __func__);
> >
> >        }
> >
> >        flush_icache_range((unsigned long)copy->dst, (unsigned
> > long)copy->dst + copy->len);
> >
> >        return ret;
> > }
> >
> > int larch_insn_text_copy(void *dst, void *src, size_t len)
> > {
> >        int ret =3D 0;
> >        size_t start, end;
> >        struct insn_copy copy =3D {
> >                .dst =3D dst,
> >                .src =3D src,
> >                .len =3D len,
> >                .cpu =3D smp_processor_id(),
> >        };
> >
> >        start =3D round_down((size_t)dst, PAGE_SIZE);
> >        end   =3D round_up((size_t)dst + len, PAGE_SIZE);
> >
> >        set_memory_rw(start, (end - start) / PAGE_SIZE);
> >        return stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_m=
ask);
> >        set_memory_rox(start, (end - start) / PAGE_SIZE);
> >
> >        return ret;
> > }
>
> here is the correct code and I have re-run the test, test passed
>
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
>        ret =3D stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_ma=
sk);
>        set_memory_rox(start, (end - start) / PAGE_SIZE);
>
>        return ret;
> }
>

change stop_machine_cpuslocked() to stop_machine() and tested again,
test passed.

int larch_insn_text_copy(void *dst, void *src, size_t len)
{
       int ret =3D 0;
       size_t start, end;
       struct insn_copy copy =3D {
               .dst =3D dst,
               .src =3D src,
               .len =3D len,
               .cpu =3D smp_processor_id(),
       };

       start =3D round_down((size_t)dst, PAGE_SIZE);
       end   =3D round_up((size_t)dst + len, PAGE_SIZE);

       set_memory_rw(start, (end - start) / PAGE_SIZE);
       ret =3D stop_machine(text_copy_cb, &copy, cpu_online_mask);
       set_memory_rox(start, (end - start) / PAGE_SIZE);

       return ret;
}

> >
> > >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > Have you tried to run the same  fentry_attach_stress mult=
iple times or
> > > > > > > > > in a loop like while true; do ./test_progs -a fentry_atta=
ch_stress;
> > > > > > > > > sleep 1; done
> > > > > > > > > the lockup happens intermittently, sometime it PASSED, so=
metime kernel
> > > > > > > > > locks up. I merged the tools/testing/selftests/bpf/config=
 with my
> > > > > > > > > original config by
> > > > > > > > > ./scripts/kconfig/merge_config.sh -y .config
> > > > > > > > > tools/testing/selftests/bpf/config. my config seems inclu=
ding
> > > > > > > > > everything  you listed above except CONFIG_ARCH_STRICT_AL=
IGN not set,
> > > > > > > > > here is my config https://www.bpfire.net/download/loongfi=
re/config.txt
> > > > > > > > >
> > > > > > > > > > Thanks,
> > > > > > > > > > Tiezhu
> > > > > > > > > >
