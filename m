Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A44611CC;
	Mon, 21 Sep 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982282; cv=none; b=JZ8oCbH6cB3C8mZMZ9jzN1EzNdNR+3yiyvJgo64qVRB31u1Kz6MRzxt200OrqkvJBvEye+/VGiDP/IMiNu70MI7TdrX9408vq6TeGROYYNNzVAmnHlUkX9cRqu2kJStJuOih37vqPbQEFEMFHz5YIK9+WGhSFsTlmCn11M+yJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982282; c=relaxed/simple;
	bh=AidCO2mwovg/tmJjK7cWMvEQ7q8YyGl1680xqAG5TuA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YlbL1PMxhR/aZkp+SLT66AGqwESsV6RzLZvEX4gMmlPGbFilG0y9rCEJ2t9gwIbLtivMg7t567mO81UR5CIYz9fy5pcP1YI8m03bpxDDmG+OFRNBuYeARzG4uZP26YQez5KTPrdHWjTqCjxH5sefagwT7zeHcckThEzI908AxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TghQBBFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TghQBBFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110E11F00893;
	Mon, 21 Sep 2026 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982280;
	bh=9Ht9zG85Yv7vBKbBbu1CVPAY2kC2RSmX6uHImGsyNrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TghQBBFFrE9MMw0lPBqk6tyi+qI/Y2LCJDRdECrz3HZwpozy3VrRCMsZqQxxRXloA
	 la/b90SIj/gEF8SVQNZiet4H9/RAwxfX5JfsuQr6jUbwO+V/9RntTbYiEU0XBpYyG6
	 fM1Jwy7DhPFjeKy1KRcEEqkJvuGXeu6uWhku62y2olZtEAGlHEpBZrO4y7LgDMIQ+h
	 wsffgpzifRVDr/R4EeOrazNAaFqQpVpvSPUI5SbJbYkrBn3MlN1kwuDGiTh7ktfJqJ
	 fU1bCfpfjq8dBiihAxS2e//9bTsR1+Ui/rFuIyh6Cu2yL+wAeSY/NVh53byzGHsgmk
	 BgR4rNzd+3Dvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/14] kexec: Fix CMA segment address translation
 with non-zero text_offset
Reply-To: sashiko-reviews@lists.linux.dev
To: sourabhjain@linux.ibm.com, rppt@kernel.org, dave.hansen@linux.intel.com, mpe@ellerman.id.au, bgwin@google.com, kees@kernel.org, zhangtianyang@loongson.cn, chenhuacai@kernel.org, eric.devolder@oracle.com, akpm@linux-foundation.org, chleroy@kernel.org, sshegde@linux.ibm.com, chao.gao@intel.com, jbouron@amazon.com, mclapinski@google.com, tangyouling@kylinos.cn, mark.rutland@arm.com, seanjc@google.com, palmer@rivosinc.com, leitao@debian.org, yeoreum.yun@arm.com, x86@kernel.org, ritesh.list@gmail.com, maqianga@uniontech.com, kernel@xen0n.name, mingo@redhat.com, takahiro.akashi@linaro.org, james.morse@arm.com, linux-arm-kernel@lists.infradead.org, bp@alien8.de, robh@kernel.org, pasha.tatashin@soleen.com, driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, hpa@zytor.com, pratyush@kernel.org, guodongtai@kylinos.cn, graf@amazon.com, catalin.marinas@arm.com, kai.huang@intel.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, npiggin@gmail.com, vishal.l.verma@intel.com, baoquan.he@linux.dev, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, me@linux.beauty, coxu@redhat.com, hbathini@linux.ibm.com, will@kernel.org, maddy@linux.ibm.com, liukexin@kylinos.cn, piliu@redhat.com, ruirui.yang@linux.dev, tglx@kernel.org, dakr@kernel.org, thuth@redhat.com, rafael@kernel.org, gregkh@linuxfoundation.org
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-2-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:17:57 +0000
Message-Id: <20260921091758.110E11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> kimage_load_cma_segment() and kimage_map_segment() both translate
> a CMA segment using page_address(cma), which returns the CMA base
> address. This ignores segment->mem.
>=20
> On arm64, image_load() adds text_offset to segment->mem before the
> segment is loaded:
>=20
> 	kernel_segment->mem +=3D text_offset;
> 	kernel_segment->memsz -=3D text_offset;
> 	image->start =3D kernel_segment->mem;
>=20
> so segment->mem no longer matches the CMA base.  The kernel payload is
> therefore copied to the wrong offset, while image->start points past
> it, and kexec jumps into the middle of the kernel.
>=20
> [ ... ]
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: stable@vger.kernel.org
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D1

