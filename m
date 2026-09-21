Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30930292B2E;
	Mon, 21 Sep 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982057; cv=none; b=CzDjHgsopj3ypECA8nLqbyWShvh/tYlkt7/NVvxWNZM/fmrOTugyyB/ej0J9ZuwRcmHfN3HDid8nU6ryO6/xqVNYjFYpR9k56sptTnwID/iPnFdddjxwVTAyWWm/OYwlnBLsYZtoQTiL3SKuFAA/GxDjErVpn9SgZey4DBxKotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982057; c=relaxed/simple;
	bh=Ypk197u83QsJkKLOBorgGsgBYWL8I8pOcxYcooVQIRs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s34evjMd3RKVHnAtXYdr65GTpOQPk0phoQBW9dDHVjDPrNgaE6LGvmrbFHncSF8h3vjkCWKy2b1jwnPai6CIlwleOE7zqM84xi04uLHrjQ3BifOy5U+gFqSXkOwv0Voq9+wIcQttz85N5M3bUkxTcjD2aoAlJNWedYSx0vXldxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVRV5Ip6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVRV5Ip6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71221F00893;
	Mon, 21 Sep 2026 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982055;
	bh=Ypk197u83QsJkKLOBorgGsgBYWL8I8pOcxYcooVQIRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BVRV5Ip6eDfnma/w5Y/czw1VeMX630hiOe8uqSGXqsjooE2XeVRpukgHT2lEjnvWu
	 6fr7DPRbl1pT/tixy4qKPgbdfhGlYyRG8mVxxP2xFNh0JvBj5PDyfoXXUlBIFmZA4A
	 wfeqAXn7vlZ95v0+IozU1UxAIzm//WFXxIjRZk5wQ7PUdrDDUM00AjwNoSV4v7h67+
	 t6gcdL1zYAKxQ8SwXrjgniMvV5ehmJobw1qZvb6XreBmqT5M27b3dOBakHQLtTBGpL
	 7Qjs+OsKh7E9v3v5BGVIpCQ8aqce4Z1ksYxVuSAybhOUsiABwrrZkUDWyNB0hScgEj
	 Xg7AZ5lBqmQ9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/14] LoongArch: kexec_file: Fix elf_headers memory
 leak in retry loop
Reply-To: sashiko-reviews@lists.linux.dev
To: james.morse@arm.com, thuth@redhat.com, me@linux.beauty, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, vishal.l.verma@intel.com, pasha.tatashin@soleen.com, sourabhjain@linux.ibm.com, baoquan.he@linux.dev, chao.gao@intel.com, akpm@linux-foundation.org, kai.huang@intel.com, mingo@redhat.com, kernel@xen0n.name, seanjc@google.com, piliu@redhat.com, mclapinski@google.com, palmer@rivosinc.com, linuxppc-dev@lists.ozlabs.org, bp@alien8.de, mpe@ellerman.id.au, driver-core@lists.linux.dev, kees@kernel.org, gregkh@linuxfoundation.org, hbathini@linux.ibm.com, chleroy@kernel.org, leitao@debian.org, will@kernel.org, x86@kernel.org, dakr@kernel.org, guodongtai@kylinos.cn, hpa@zytor.com, maddy@linux.ibm.com, takahiro.akashi@linaro.org, catalin.marinas@arm.com, sshegde@linux.ibm.com, loongarch@lists.linux.dev, zhangtianyang@loongson.cn, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, maqianga@uniontech.com, mark.rutland@arm.com, chenhuacai@kernel.org, tangyouling@kylinos.cn, eric.devolder@oracle.com, tglx@kernel.org, ruirui.yang@linux.dev, graf@amazon.com, bgwin@google.com, npiggin@gmail.com, pratyush@kernel.org, rafael@kernel.org, yeoreum.yun@arm.com, coxu@redhat.com, liukexin@kylinos.cn, dave.hansen@linux.intel.com, ritesh.list@gmail.com, rppt@kernel.org, jbouron@amazon.com, robh@kernel.org
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-8-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:14:12 +0000
Message-Id: <20260921091412.C71221F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> If load_other_segments() fails after image->elf_headers is assigned,
> the memory lifecycle is safely managed by the global kimage object
> and will be freed in arch_kimage_file_post_load_cleanup().
>=20
> However, during a retry loop in efi_kexec_load(), a subsequent iteration
> will allocate a new buffer and overwrite image->elf_headers. This
> permanently leaks the stale memory from the previous iteration before
> the global cleanup can track it.
>=20
> Fix this by explicitly freeing the stale `image->elf_headers` buffer
> before assigning the newly allocated headers.
>=20
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%=
40huawei.com
> Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D7

