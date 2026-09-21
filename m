Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D527FB37;
	Mon, 21 Sep 2026 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981991; cv=none; b=MJ7eLLid4s80IYoxqb/ahLl0GIJKPDhHq0LEMX4fzfmpZFTr5wRM1mqnDuKwNPz7xKGH0i5tj8q2UXo334zQtNV0AnCnVw6jjVhsKlgAN9J6wymfTBE5CbRJkLDdlV+Q4togy5shusg+sh/h86w2ligVwkA9E2PuvvSPfoB11XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981991; c=relaxed/simple;
	bh=P6ZIStLe13F9+IEhFgWAmfeV8KvN9bBmU0oNpKNZKz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i5gYBvHkcxs0t+O2C9sIxFPYMJ8qybzcohmONo/RYNVrrRJ0Clk7azkos/7Hbr5nKlDFwuy699XhKNC8pHfTieYcHh2SVyzhcVy6/dvCas3RWK0/1k4bZnZt1GUet8XtcVwqzQaYoMrbayBhQQ1jkQtuc+BGOBna69urRseGe1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PppuWxQJ reason="signature verification failed"; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PppuWxQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0A81F00899;
	Mon, 21 Sep 2026 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981989;
	bh=P6ZIStLe13F9+IEhFgWAmfeV8KvN9bBmU0oNpKNZKz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PppuWxQJKHoapfcOZ30hzQM6stx9pvdYb0iP5RCVos4bWWyMp2tUc+UKk78wNflkr
	 mAcR+1udALmuvYeXt3XZ68KLQruIJp5QseLO8HmvvZRjI50jC3vPIw76Z9/rQ1BdL7
	 Tv7UqqrkClXkDZgXM27TcTKF74zd419tu0rkSqQKNbbOXP5lyJXxkwhYciODTmZqoP
	 dRuKoxXt/D0AtemjRV1cM6kg3SBzTbtbGCqWys71V/5YyBHFWj9t1EWpxhCEAjNwUg
	 OfFRkvzI3+0ZHWw0TJjJ9X3syCl+J3H2W+X5qUE6Mf95lC+mJKuoe1BZvZWZqJb654
	 G4GynZC1CxzKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/14] LoongArch: kexec_file: Fix CMA page leaks in
 segment placement retry loops
Reply-To: sashiko-reviews@lists.linux.dev
To: npiggin@gmail.com, ritesh.list@gmail.com, sshegde@linux.ibm.com, piliu@redhat.com, guodongtai@kylinos.cn, will@kernel.org, eric.devolder@oracle.com, vishal.l.verma@intel.com, maddy@linux.ibm.com, mpe@ellerman.id.au, bp@alien8.de, kai.huang@intel.com, chao.gao@intel.com, robh@kernel.org, seanjc@google.com, dakr@kernel.org, pasha.tatashin@soleen.com, kernel@xen0n.name, rppt@kernel.org, zhangtianyang@loongson.cn, hbathini@linux.ibm.com, baoquan.he@linux.dev, james.morse@arm.com, thuth@redhat.com, loongarch@lists.linux.dev, yeoreum.yun@arm.com, coxu@redhat.com, chenhuacai@kernel.org, akpm@linux-foundation.org, kees@kernel.org, jbouron@amazon.com, pratyush@kernel.org, me@linux.beauty, mark.rutland@arm.com, chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, sourabhjain@linux.ibm.com, linux-arm-kernel@lists.infradead.org, graf@amazon.com, gregkh@linuxfoundation.org, liukexin@kylinos.cn, x86@kernel.org, mclapinski@google.com, ruirui.yang@linux.dev, takahiro.akashi@linaro.org, hpa@zytor.c
 om, rafael@kernel.org, palmer@rivosinc.com, dave.hansen@linux.intel.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, maqianga@uniontech.com, tangyouling@kylinos.cn, bgwin@google.com, driver-core@lists.linux.dev, catalin.marinas@arm.com, tglx@kernel.org, mingo@redhat.com, leitao@debian.org, linux-kernel@vger.kernel.org
Cc: ruanjinjie@huawei.com, kexec@lists.infradead.org
In-Reply-To: <20260921090450.807575-7-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:13:06 +0000
Message-Id: <20260921091306.BE0A81F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> During kexec image placement retry loops, any midway failure causes
> the loader to truncate `image->nr_segments` back to its initial state
> to purge the failed segments.
>=20
> However, this truncation introduces a memory leak. The CMA pages
> allocated via kexec_add_buffer() during the failed attempt are tracked
> in the `image->segment_cma` array. Because the subsequent cleanup paths
> only iterate up to the truncated `nr_segments` boundary, these allocated
> CMA pages outside the new boundary are permanently leaked.
>=20
> Fix this by explicitly releasing the associated CMA buffers in
> the failure paths before `image->nr_segments` is reduced.
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
75-1-ruanjinjie@huawei.com?part=3D6

