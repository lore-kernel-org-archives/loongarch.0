Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608A45D5C9;
	Mon, 21 Sep 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982162; cv=none; b=ef3AHdog7WOIng6/CYX9DA2fblk504VWNvtJSpD5zayBHD832T1sQksB7b5JH7p7NS8pcvdYvBYd+ZreVTLy73uuWOPEX9SmB+5wzVXMu7mhuaRWu1EFlVWvtNUmO2gTc33UADLKap6oYUgUDTrvIfKQL1CGD55JKZiyqsJi7y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982162; c=relaxed/simple;
	bh=JDgKkGiV52y79Vv8IixoY+h4dSdmAbZlRqNz6R5T1OY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DuSiD4DQjsp1C6Okk7CZsKgx3sfV9gNvVDTXo6w69yV2RDtHG4n7lXNafJ6qKsv4UortL/wsPjREOInGIWRYa41to2fIgCkWQEyN/KVjGDRXsb3gIftYEHNHfnj7mqyTa72xbjYCkhXUJnYXJskqMMWXRyfGlrQvW3oKUT032MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHG0fA+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHG0fA+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B4C1F00898;
	Mon, 21 Sep 2026 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982161;
	bh=iKFnnUVgMFXCyMZXDC0Gp9g2hFUBByCOSHmRiQGpkGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eHG0fA+GVBiImiZzlsuxCmiW4QIyTR/aPZvoP9v5NylyTbUhwz4qciulTNW5LXkXq
	 K3WKoRW+fr226xkxw7R8r5SnsneEjP6Axshr6u75njSZGCXcCVluZnG9xDRpyDY6xs
	 EFriL5emiLA/XLPMxq58s20ogoBPHi1s/Ak8FZ6OgYDuj1unhLvxtbQY/CLkUuDL3Q
	 1ZwP/YXZpcRKGPEnhufv0pbrNo41MXu7WUOt6ucbymZFWiH5nhO2OL77j+WD7zsECf
	 0lyezSqj6JCNikhjuCaXKWXmVNvuRoNz090YaolbMqD14eT8wEpe3E1pvpPf0p4jC7
	 dKFuz1EbnrY7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/14] LoongArch: kexec_file: Fix a modified_cmdline
 leak
Reply-To: sashiko-reviews@lists.linux.dev
To: maqianga@uniontech.com, dakr@kernel.org, kees@kernel.org, mingo@redhat.com, seanjc@google.com, gregkh@linuxfoundation.org, mpe@ellerman.id.au, driver-core@lists.linux.dev, palmer@rivosinc.com, chleroy@kernel.org, coxu@redhat.com, akpm@linux-foundation.org, piliu@redhat.com, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, mclapinski@google.com, robh@kernel.org, maddy@linux.ibm.com, hpa@zytor.com, ruirui.yang@linux.dev, bgwin@google.com, leitao@debian.org, catalin.marinas@arm.com, jbouron@amazon.com, npiggin@gmail.com, guodongtai@kylinos.cn, kai.huang@intel.com, sourabhjain@linux.ibm.com, bp@alien8.de, baoquan.he@linux.dev, pratyush@kernel.org, pasha.tatashin@soleen.com, chenhuacai@kernel.org, zhangtianyang@loongson.cn, ritesh.list@gmail.com, vishal.l.verma@intel.com, thuth@redhat.com, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com, tglx@kernel.org, yeoreum.yun@arm.com, sshegde@linux.ibm.com, rppt@kernel.org, will@kernel.org, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, rafael@kernel.org, kernel@xen0n.name, me@linux.beauty, james.morse@arm.com, linux-arm-kernel@lists.infradead.org, dave.hansen@linux.intel.com, liukexin@kylinos.cn, graf@amazon.com, mark.rutland@arm.com, chao.gao@intel.com, takahiro.akashi@linaro.org, eric.devolder@oracle.com, tangyouling@kylinos.cn
Cc: ruanjinjie@huawei.com, kexec@lists.infradead.org
In-Reply-To: <20260921090450.807575-9-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:15:57 +0000
Message-Id: <20260921091558.56B4C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> load_other_segments() allocates modified_cmdline and stores it in
> image->arch.cmdline_ptr.  machine_kexec_prepare() then copies it to
> KEXEC_CMDLINE_ADDR and overwrites the pointer, so the heap buffer is
> leaked on every successful kexec_file_load().
>=20
> Free the buffer after the copy.
>=20
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Kexin Liu <liukexin@kylinos.cn>
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: Qiang Ma <maqianga@uniontech.com>
> Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
> Cc: George Guo <guodongtai@kylinos.cn>
> Cc: stable@vger.kernel.org
> Fixes: d162feec6b6e ("LoongArch: Add preparatory infrastructure for kexec=
_file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D8

