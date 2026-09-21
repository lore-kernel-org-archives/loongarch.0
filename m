Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8434534A9;
	Mon, 21 Sep 2026 09:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982013; cv=none; b=lDuMXBXYx7D51ZVlLFktaAk7feL1ib9946uQlVPGzU2UOD7+x8ULG0bFEfKTBi6BCwkieIUIt5u/4e7Av2hISXjHu17Ilo+2R6oLApeb+gxnPcNPIdd4OQ9mZZj98Hq4Dv//OjVnmUBsGkSuWgBXxe3aOQeml+mcj5q4atIO8H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982013; c=relaxed/simple;
	bh=ci45NQJUg16aZt0y5PeWLAJ6VMj1xm674PK6gI0wb/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FyUyuSfJGmk428zO05ZD3yDeR20chR8/sddkdqQm9hhyM18Z1X2sCsMU3J9Ccc1HpxPWm6hu4yAT3vIoUuTTCeBAuzeJ8so+DDQzPrKFfkJKYtGET2IgFnyt5Mqayfc0yUGiatn2BnUTPFzN0SgTl2Nq7bByYW99Po41rQ5dkm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQm7ODC9 reason="signature verification failed"; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQm7ODC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7991F000FF;
	Mon, 21 Sep 2026 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982012;
	bh=ci45NQJUg16aZt0y5PeWLAJ6VMj1xm674PK6gI0wb/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BQm7ODC9zYGHKV67q4Nfd43WItBUGZ+KMMxaKTqYb5AhTE8ADj41mMaTjg3RxBvWI
	 glxoDGBTc459VqLuYagv74owIjybea8BCkEyHEdwCmH/VGab6tEu/+hGad9cF4E+ue
	 xDuvLwRpwfVs5i/zBUDnnOntEVtA5B9SkCoPsl4itcUYjcAYbm9Hf9Rp7M8PO1dSc/
	 KFDzRwjifRSqZchkKanhAtrLnZM5sa5GozgtkNjqy+1fiUofkSE87lzR6WP99e4rDC
	 04xzaQbnncwm12YgbDEScupqgAvEzFrU8YDNxRun5O3k9l5kAvSR6W5ZWdMEB6okYN
	 1cZfCEFxPvvyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/14] kexec: Extract kexec_free_segment_cma() from
 kimage_free_cma()
Reply-To: sashiko-reviews@lists.linux.dev
To: dakr@kernel.org, hbathini@linux.ibm.com, npiggin@gmail.com, maqianga@uniontech.com, vishal.l.verma@intel.com, baoquan.he@linux.dev, piliu@redhat.com, ruirui.yang@linux.dev, linuxppc-dev@lists.ozlabs.org, pratyush@kernel.org, maddy@linux.ibm.com, bgwin@google.com, robh@kernel.org, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, mingo@redhat.com, me@linux.beauty, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, takahiro.akashi@linaro.org, james.morse@arm.com, yeoreum.yun@arm.com, mark.rutland@arm.com, eric.devolder@oracle.com, coxu@redhat.com, chao.gao@intel.com, ritesh.list@gmail.com, kees@kernel.org, liukexin@kylinos.cn, leitao@debian.org, sourabhjain@linux.ibm.com, tglx@kernel.org, kernel@xen0n.name, bp@alien8.de, loongarch@lists.linux.dev, rafael@kernel.org, seanjc@google.com, dave.hansen@linux.intel.com, palmer@rivosinc.com, pasha.tatashin@soleen.com, rppt@kernel.org, driver-core@lists.linux.dev, kai.huang@intel.com, graf@amazon.com, jbouron@amazon.com, guodongtai@kylinos.cn, thuth@redhat.com, chenhuacai@kernel.org, linux-arm-kernel@lists.infradead.org, hpa@zytor.com, gregkh@linuxfoundation.org, akpm@linux-foundation.org, sshegde@linux.ibm.com, will@kernel.org, x86@kernel.org, mpe@ellerman.id.au, chleroy@kernel.org, mclapinski@google.com, tangyouling@kylinos.cn, zha
 ngtianyang@loongson.cn
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-4-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:13:29 +0000
Message-Id: <20260921091330.2D7991F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> kimage_free_cma() relies on image->nr_segments to iterate over segments.
> When an architecture loader (e.g., arm64) truncates nr_segments on a
> mid-way failure, CMA pages allocated beyond the new boundary become
> unreachable, causing silent memory leaks.
>=20
> Extract the per-segment freeing logic into the exported helper
> kexec_free_segment_cma(), so that architecture loaders can release
> individual segments before nr_segments is truncated. Refactor
> kimage_free_cma() to loop over the new helper, preserving existing
> behavior.
>=20
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Breno Leitao <leitao@debian.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D3

