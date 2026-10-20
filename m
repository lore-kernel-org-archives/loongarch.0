Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483825;
	b=DvMs1SgXH40X5oicUSKDuXUpft6Glx+wq/Ygw9bDOcRTnuShXaCZSTUJ0kxvjkDJeJFt
	 peYhiNyjOZQLDJS2T3tkVN6vV6AVHYQBZiW/UIlHglNpuMEvfL/uC/b8NWpDD6+a5Uhkp
	 l+oScxK3g42oKP2EHT9GLTN8DKUXOJmxGXJpUvtIYPs5NEPnBnYp51BTRqE+eKnu3Nsep
	 s6IkzeziyEojX9tJGZR+eHywt2RHRgQF4YPQI8itdpkUqslaLeKXnWzmd96UjtUQaKGm9
	 OEq+n0WpiExoY3sJZivJhi6Y5kPnAlIcmFaqLBBI27BhuUE/xVU992cs+ru7wTQcqNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483825;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=yBYSrHGCRn0VnGOMETmfFB9n0GdErJoxxpvBx0Cls0A=;
	b=eo1K4KzZ+I+vPKgE1X5RdV+gGYNanIoPmLo56qWc7YhaWcQXUexdRsHh+Rm6exThi+Oh
	 8E/PA3EEl5RFT7DuhEWB2vHQxr+b3SAeFtQ9YjrDQcIqEKZ2lunBPBt4LwuijJcBe2uaW
	 xpeWXcSkkrWJZyrD7PpEil3nPIA+zqY7RuCgwwcHYp2YeIEBBWu33/xBzrWHGxT5zz8fu
	 KJor4LYvk6jydGlDgB59ExFMHEQQs6U9z+xB+8jRW8/1zlUG1GCWtRJeAzKuiI8DESdOb
	 kqBoY4XQJsi2kPR/COkpWdHmSUjnxy89pSzpcJTy+Jdov5xGYd87sFA/uc/IyVnfWuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4RM1DJx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF7606A31B;
	Tue, 20 Oct 2026 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4RM1DJx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4671F000C4;
	Tue, 20 Oct 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483825;
	bh=yBYSrHGCRn0VnGOMETmfFB9n0GdErJoxxpvBx0Cls0A=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=M4RM1DJxucPrV9uY8fDO6NsLZA+LShmgNV4RcxcG9OSaNxMDvLJzUKksUlvNfLCLK
	 B97wnUobAdittrCZdufknf0Lq53w5WdQcPJn0X7K3DwA0KBALEVtqaN8EmGbA5eu9r
	 b1Kg6NkzyNR9hIQ4FsHdOENrCRWHrMqTUBy3AOd2oD0BbBd2ErC5rE9Se/fzTqOlMD
	 lOIGdbHvJJNmS0Lgv6BZAGQ4mBHURySJ2SB1TgNH5wAyJJpRH2n69kFyItaw948hhO
	 syFBn+u9Hq6iAJmtlRPuJw2+7EK12R/9EeP+zziXUplV6kPQ9Pxv2918smIV3WWv5j
	 TZGTZLDl1MOEA==
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 02/14] kexec: Record allocated CMA pages to fix
 release size mismatch
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
 chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
 ritesh.list@gmail.com, sshegde@linux.ibm.com, tglx@kernel.org, 
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
 leitao@debian.org, yeoreum.yun@arm.com, sourabhjain@linux.ibm.com, 
 robh@kernel.org, coxu@redhat.com, kees@kernel.org, tangyouling@kylinos.cn, 
 liukexin@kylinos.cn, zhangtianyang@loongson.cn, guodongtai@kylinos.cn, 
 maqianga@uniontech.com, chao.gao@intel.com, kai.huang@intel.com, 
 vishal.l.verma@intel.com, seanjc@google.com, piliu@redhat.com, 
 thuth@redhat.com, jbouron@amazon.com, me@linux.beauty, 
 mclapinski@google.com, graf@amazon.com, bgwin@google.com, 
 hbathini@linux.ibm.com, eric.devolder@oracle.com, 
 takahiro.akashi@linaro.org, james.morse@arm.com, palmer@rivosinc.com, 
 x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 kexec@lists.infradead.org
In-Reply-To: <20260921090450.807575-3-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-3-ruanjinjie@huawei.com>
Date: Tue, 20 Oct 2026 11:09:39 +0300
Message-Id: <179248377975.302547.8708639983163316788.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> The CMA pages allocated for a kexec segment are released using the
> segment's memsz to calculate the number of pages. However, some
> architecture loaders modify the segment's memsz after allocation
> (e.g. arm64 subtracts text_offset), causing the release function to
> free fewer pages than were originally allocated, leaking the remaining
> CMA pages.

Like in the previous patch, arm64 essentially subtracts zero for any
kernel newer than v5.8, so deprecating .text_offset in arm64 seems to me
a better solution.

-- 
Sincerely yours,
Mike.

