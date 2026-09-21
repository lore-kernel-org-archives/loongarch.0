Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D044B663;
	Mon, 21 Sep 2026 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982090; cv=none; b=KkAp7Yv0x1xJjtk6iiQiYVpuCd1baOAVxoFQmF5BpberVxVZK7pJTXm312MN6/GwT1LQ/3wONIbTttSXLgOVi2gYiL4iK150zpRKQ5a/EErgr6ULtqaghyt+5MreGNh3RMiEXo24VYNoJH2AgOku3fl0mHU0Ji+btbAnjwv1HvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982090; c=relaxed/simple;
	bh=Zko84IbjSpSVbu6MJAXmtfMpiKo1YS8MUshdlf8j2Mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iGPPXgfp/gMHrXMTnOHjYVzga0lfINHNzfeWdv0DO9vgr0pRx0R8ymebb2SaZCa7gsl38+9d3iEDdsm1+bIGnuW8F/qo2LYYlnUsbQsCdoBpPpKNiYfBRWRoFIXijdyRESbJQN2cllBCN6sZps7q83reaOZ3j3cFKIHkClEW28g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbmDc19p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbmDc19p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2761F00893;
	Mon, 21 Sep 2026 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982089;
	bh=Zko84IbjSpSVbu6MJAXmtfMpiKo1YS8MUshdlf8j2Mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YbmDc19pVl41nW9kuv93uhEHlhM/v+WaAWJ9m4SLnKvh1aNqKldO2WFZ8RlKUoo8K
	 ja8gNwEoFhEQED3ytCk8w6m78nujcqwmcNnvwUN937QUOBieV6pzw66CaVyATAvKWv
	 Wov7dlZAhGobnHj2/fsSFSgUeP9eDxTIivOPU6PyMvkjZtz42Nc7pgA+fy+Z5zOxjL
	 3F8jNT0HdjMOArL/aDzdaJBnTUsvZBBPGyGt6/T8i6E6yRBo/gjXO3LQeVxXqh1+pb
	 FzpD5+KAnowSeF0962ABOLblenxsOgdlhBPpVmj4XHZhZC/ZMAr3p1bAAlQTOh6y9b
	 E7cZo208OqNHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/14] kexec: Record allocated CMA pages to fix
 release size mismatch
Reply-To: sashiko-reviews@lists.linux.dev
To: rafael@kernel.org, eric.devolder@oracle.com, chao.gao@intel.com, ritesh.list@gmail.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org, leitao@debian.org, sshegde@linux.ibm.com, kees@kernel.org, robh@kernel.org, loongarch@lists.linux.dev, chleroy@kernel.org, liukexin@kylinos.cn, x86@kernel.org, hbathini@linux.ibm.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, maddy@linux.ibm.com, guodongtai@kylinos.cn, mclapinski@google.com, gregkh@linuxfoundation.org, me@linux.beauty, pratyush@kernel.org, palmer@rivosinc.com, hpa@zytor.com, bp@alien8.de, vishal.l.verma@intel.com, bgwin@google.com, takahiro.akashi@linaro.org, chenhuacai@kernel.org, seanjc@google.com, dave.hansen@linux.intel.com, tglx@kernel.org, yeoreum.yun@arm.com, akpm@linux-foundation.org, sourabhjain@linux.ibm.com, driver-core@lists.linux.dev, mpe@ellerman.id.au, will@kernel.org, tangyouling@kylinos.cn, dakr@kernel.org, baoquan.he@linux.dev, graf@amazon.com, kai.huang@intel.com, pasha.tatashin@soleen.com, jbouron@amazon.com, mingo@redhat.com, ruirui.yang@linux.dev, rppt@kernel.org, kernel@xen0n.name, thuth@redhat.com, coxu@redhat.com, catalin.marinas@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, maqianga@uniontech.com, piliu@redhat.com, linuxppc-dev@lists.ozlabs.org, james.morse@arm.com, zhangtianyang@loongson.cn
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-3-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:14:45 +0000
Message-Id: <20260921091446.3F2761F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> The CMA pages allocated for a kexec segment are released using the
> segment's memsz to calculate the number of pages. However, some
> architecture loaders modify the segment's memsz after allocation
> (e.g. arm64 subtracts text_offset), causing the release function to
> free fewer pages than were originally allocated, leaking the remaining
> CMA pages.
>=20
> Add a per-segment `segment_cma_pages` array to store the number of
> pages actually allocated from CMA. Populate it during
> kexec_add_buffer() using the aligned memsz, and use it in
> kimage_free_cma() to accurately release all allocated pages.
>=20
> This avoids relying on the potentially modified segment->memsz and
> prevents silent CMA memory leaks.
>=20
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Brian Mak <makb@juniper.net>
> Cc: Pingfan Liu <piliu@redhat.com>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Justinien Bouron <jbouron@amazon.com>
> Cc: Li Chen <me@linux.beauty>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%=
40huawei.com
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D2

