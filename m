Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EEC45FFC7;
	Mon, 21 Sep 2026 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982114; cv=none; b=PN8NIYDFmN3hgP7PDfqI0Mj/R8aUOYmoyQqjcbIPA0N9Kj5/BP55P41rVIgemEDQxd+Xx+5UBoko82V/6x60Q8LVAVKnGl1grlQM972FEimCFsMdqo/fN93ARmiYJ+JssbG5DFkK5cihbzDZYyQEisG7yWORcxUurnZ0njBdhc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982114; c=relaxed/simple;
	bh=3ZanDre/sxM7yOn9EPACCus3LOsx6cj95+yc4nBcgzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TCo2Sq2n/DTYWCJWgRQnx/s88/zUFBZlj71/lvvLVEBNDJsS/uPt6ihFjpqEz/J9hNuvL+An0Y1PjVnrboqom0eZylsW+GvHJyO2T5dRtnup/+tZilbADVLhzm9jYUXLPC/CpMHuW7iBJBRpGgjRcUbZj55CFpD5VfLhgz/8lUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOEN+RoD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOEN+RoD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A930B1F000FF;
	Mon, 21 Sep 2026 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982112;
	bh=3ZanDre/sxM7yOn9EPACCus3LOsx6cj95+yc4nBcgzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZOEN+RoDDK26gDP5B5Z9LlLZO1s1nCn5eg6mIuaCu6GgNZmdhLQxLNmwagQJw3jNZ
	 HSTQKCve+9oH2k8A8MzFqJ15CxKt8vEI7iKnmIVQDfJqq1n7HPsA2n8TLYeSCy0aiN
	 FpDbwb94QreklK9goP5shle0U5QXsF6FQ01poX7/gzwPVreCPhjjIvl7Uw9RSL93Iy
	 GF6JPlRgde+gm7ZRr0IwEGKaUN5B90anrRojkn+vTBJ4R+6PruEi9YQMY32D/IGpJo
	 29xGW3a7rZhzUio5PLTxY6Wlb6TkskdZxe2IUURQwsc33w61NyfOl8XPq/R3ZUEKk7
	 0Dcdsu9FyY3LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/14] arm64: kexec_file: Fix elf_headers memory leak
 in retry loop
Reply-To: sashiko-reviews@lists.linux.dev
To: kees@kernel.org, eric.devolder@oracle.com, yeoreum.yun@arm.com, driver-core@lists.linux.dev, hbathini@linux.ibm.com, me@linux.beauty, rppt@kernel.org, jbouron@amazon.com, hpa@zytor.com, linux-arm-kernel@lists.infradead.org, dakr@kernel.org, maddy@linux.ibm.com, tangyouling@kylinos.cn, will@kernel.org, mark.rutland@arm.com, dave.hansen@linux.intel.com, sourabhjain@linux.ibm.com, catalin.marinas@arm.com, leitao@debian.org, vishal.l.verma@intel.com, bp@alien8.de, guodongtai@kylinos.cn, zhangtianyang@loongson.cn, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, rafael@kernel.org, kai.huang@intel.com, mclapinski@google.com, piliu@redhat.com, sshegde@linux.ibm.com, thuth@redhat.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, coxu@redhat.com, linux-kernel@vger.kernel.org, x86@kernel.org, chenhuacai@kernel.org, chao.gao@intel.com, ruirui.yang@linux.dev, bgwin@google.com, takahiro.akashi@linaro.org, palmer@rivosinc.com, seanjc@google.com, chleroy@kernel.org, liukexin@kylinos.cn, pratyush@kernel.org, kernel@xen0n.name, james.morse@arm.com, maqianga@uniontech.com, npiggin@gmail.com, baoquan.he@linux.dev, gregkh@linuxfoundation.org, akpm@linux-foundation.org, ritesh.list@gmail.com, graf@amazon.com, tglx@kernel.org, mingo@redhat.com, robh@kernel.org, mpe@ellerman.id.au, pasha.tatashin@soleen.com
Cc: ruanjinjie@huawei.com, kexec@lists.infradead.org
In-Reply-To: <20260921090450.807575-6-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:15:09 +0000
Message-Id: <20260921091509.A930B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> If load_other_segments() fails after image->elf_headers is assigned,
> the memory lifecycle is safely managed by the global kimage object
> and will be freed in arch_kimage_file_post_load_cleanup().
>=20
> However, during a retry loop in image_load(), a subsequent iteration
> will allocate a new buffer and overwrite image->elf_headers. This
> permanently leaks the stale memory from the previous iteration before
> the global cleanup can track it.
>=20
> Fix this by explicitly freeing the stale `image->elf_headers` buffer
> before assigning the newly allocated headers.
>=20
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 108aa503657e ("arm64: kexec_file: try more regions if loading segm=
ents fails")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D5

