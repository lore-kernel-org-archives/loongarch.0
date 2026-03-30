Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F93A7F4C
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857003; cv=none; b=geeZa9Ej03M6IyT3aPziRzN+lrfDbx8LEnIz05Sgtx5f5KW/x8/9v8JsI/3LYbWh3Cwg6EvhjXIuiXMLv7S87BVKoh8RZG74wpBS4T/C+y1qPo5aul3zv0NJHftfR5wiBWm46QLO/aN+UYmLdn3x5MLjHVbqjz+OZVUmV6teGHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857003; c=relaxed/simple;
	bh=6kNN1RP6hfrxfLPYE0OI9tP3SvLOgSwkQmqyXhzTfyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2Cz97mmfpEznwhRr/IbOG40lZih94+zERuhib1icLg++Q/zxIsgUpVSvkgQCdyjDbYa2AqhrslZAF+Ep14M7zryVfDcEm9+rqdwAd3BoHglGGjAFG2DynHajs0/IiB9o/L9/JhxGjX37tprbo24N4quIVe1v2yPy4O/rYzPcFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMeYBS8X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMeYBS8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E58C2BCB6
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774857002;
	bh=6kNN1RP6hfrxfLPYE0OI9tP3SvLOgSwkQmqyXhzTfyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VMeYBS8XLiSnozY/+PyQikDS+OlJeUWp1quu4k7DkInQORau+6oGY+rz/2Kb8Wlob
	 T2NLtM1Yql2DrEg0eExqOZQpa90OuxhHq/9DY3NCj7RPKCjwoNBfWR19oq0jvFAPVR
	 MfEi17ra8AoooMVEgRc9f3vRilbrvmdVeD1YtKp8CFdZ3W6wHMwVxuvPWSlPPVt/Rv
	 mukTs3pjTnzIFeCNpofgLM31M/VzIErLMHX+mWYsdu06+bfRvO+FTQhaRgHmwJkXZx
	 KH5WMUVmvn9eRV/qrNnBPBHCQp1fMyfXZf1IksNij4wcbG3AX6FZWFzWHmBERdybK9
	 /jAuHLcEVrzkg==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso289482f8f.1
        for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 00:50:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVksDtpvpPm3jNHKOaZuLLXOHDCzVFVh/5CvUOhjiCTtTVIDpYbzd+RxrwNC3WHRqkgBqv+kQ6xVeE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhnhYhV7sS9XU0PZtCoSI9jHSz0nJtRwLPLAUBstQ4BeP+2jED
	X/6tm2AIeDCxlify17++A1fek8p4+ot50mRdCccanDULOjNthKJJia8O5qjusWE17U9biNZvJ9b
	2tegeVEIAkRxaOEXTjdfqGvyKLonEB/A=
X-Received: by 2002:a05:6000:2409:b0:43b:447a:11b8 with SMTP id
 ffacd0b85a97d-43b9e9d6050mr19116932f8f.6.1774857000398; Mon, 30 Mar 2026
 00:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328074013.3589544-1-ruanjinjie@huawei.com>
 <20260328074013.3589544-2-ruanjinjie@huawei.com> <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
 <baa90080-9e6e-c1e5-13a1-b17496c690b4@huawei.com>
In-Reply-To: <baa90080-9e6e-c1e5-13a1-b17496c690b4@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 30 Mar 2026 15:49:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQE58ooXwyPSztDHbrxMRWCWhJNMKcRJZJsmKznBD12wA@mail.gmail.com>
X-Gm-Features: AQROBzBd-gKOewl3PX_5GW7wfDT6ZMEcMbV186WYHO9lbJECvy1QYs-DBc7P3MM
Message-ID: <CAJF2gTQE58ooXwyPSztDHbrxMRWCWhJNMKcRJZJsmKznBD12wA@mail.gmail.com>
Subject: Re: [PATCH v11 01/11] riscv: kexec_file: Fix crashk_low_res not
 exclude bug
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	peterz@infradead.org, feng.tang@linux.alibaba.com, 
	pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	rppt@kernel.org, leitao@debian.org, ardb@kernel.org, cfsworks@gmail.com, 
	osandov@fb.com, jbohac@suse.cz, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, coxu@redhat.com, fuqiang.wang@easystack.cn, 
	liaoyuanhong@vivo.com, chenjiahao16@huawei.com, hbathini@linux.ibm.com, 
	takahiro.akashi@linaro.org, james.morse@arm.com, lizhengyu3@huawei.com, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 3:11=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
>
>
> On 2026/3/30 11:49, Guo Ren wrote:
> > On Sat, Mar 28, 2026 at 3:41=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.=
com> wrote:
> >>
> >> As done in commit 944a45abfabc ("arm64: kdump: Reimplement crashkernel=
=3DX")
> >> and commit 4831be702b95 ("arm64/kexec: Fix missing extra range for
> >> crashkres_low.") for arm64, while implementing crashkernel=3DX,[high,l=
ow],
> >> riscv should have excluded the "crashk_low_res" reserved ranges from
> >> the crash kernel memory to prevent them from being exported through
> >> /proc/vmcore, and the exclusion would need an extra crash_mem range.
> >>
> >> Cc: Guo Ren <guoren@kernel.org>
> >> Cc: Baoquan He <bhe@redhat.com>
> >> Fixes: 5882e5acf18d ("riscv: kdump: Implement crashkernel=3DX,[high,lo=
w]")
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> ---
> >>  arch/riscv/kernel/machine_kexec_file.c | 14 +++++++++++---
> >>  1 file changed, 11 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kerne=
l/machine_kexec_file.c
> >> index 54e2d9552e93..3f7766057cac 100644
> >> --- a/arch/riscv/kernel/machine_kexec_file.c
> >> +++ b/arch/riscv/kernel/machine_kexec_file.c
> >> @@ -61,7 +61,7 @@ static int prepare_elf_headers(void **addr, unsigned=
 long *sz)
> >>         unsigned int nr_ranges;
> >>         int ret;
> >>
> >> -       nr_ranges =3D 1; /* For exclusion of crashkernel region */
> >> +       nr_ranges =3D 2; /* For exclusion of crashkernel region */
> >>         walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callb=
ack);
> >>
> >>         cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
> >> @@ -76,8 +76,16 @@ static int prepare_elf_headers(void **addr, unsigne=
d long *sz)
> >>
> >>         /* Exclude crashkernel region */
> >>         ret =3D crash_exclude_mem_range(cmem, crashk_res.start, crashk=
_res.end);
> >> -       if (!ret)
> >> -               ret =3D crash_prepare_elf64_headers(cmem, true, addr, =
sz);
> >> +       if (ret)
> >> +               goto out;
> >> +
> >> +       if (crashk_low_res.end) {
> >> +               ret =3D crash_exclude_mem_range(cmem, crashk_low_res.s=
tart, crashk_low_res.end);
> > Exclude crashk_low_res is reasonable, but have you tested this?
>
> Just simply tested on qemu with crashkernel=3D4G with following kexec
> mentioned in
> https://lore.kernel.org/all/20230726175000.2536220-1-chenjiahao16@huawei.=
com/.
> And the second kernel can be started normally.
>
> https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2
>
> # dmesg | grep crash
> [    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000
> (128 MB)
> [    0.000000] crashkernel reserved: 0x000000017fe00000 -
> 0x000000027fe00000 (4096 MB)
Adding a test log to the commit log makes the patch more trustworthy.

Reviewed-by: Guo Ren <guoren@kernel.org>

>
>
>
> >
> >> +               if (ret)
> >> +                       goto out;
> >> +       }
> >> +
> >> +       ret =3D crash_prepare_elf64_headers(cmem, true, addr, sz);
> >>
> >>  out:
> >>         kfree(cmem);
> >> --
> >> 2.34.1
> >>
> >
> >



--=20
Best Regards
 Guo Ren
