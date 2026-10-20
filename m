Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483811;
	b=D59rNpbrmmFHcxo7/jVZzXvGoa7xig/1zyaLHk+hJxTBojT4NXDJ2Gd0o7ZyiT+Qd5QY
	 j73DkCiTJa1ys/EvDu9xZmNkd3GzYq074OJ2hgkbAj0dcSOObtQlCSf6gH0MRhgEV7Uka
	 VYT+7+Jk2xvDR9w4Ir2rdzrEvB/A6hkJ8QHldp2DJEQErSQp0ptmM11WDVWrcZa0hpx3Y
	 0y+G+AC79PJL1lsbaveHpGJSaFufjsg8/curw+N3Avrq4bFL4ndA5NloAV5WhNVuMa63W
	 esh2JARSSeV2Xs/GxZX9jGUEb0sqpy6/Eie85KnZGgr+GhNgIHxy0mJXfAh8tjTDK0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483811;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=IL/ezpdN5w+pYR3PWaXa2V0Ctgdyc4AXOvpXb4+oGbM=;
	b=ai3b5IiybBCkr3TcrrhSbfRQWdqBroDezWMltmXwcoB0lWvN+zSzT41WtVi0OiJ/14D3
	 swyJQSSgPeignFVXZWaEG9jPPVXMmNMGoKJEFoDbWN/cehOiYQifDKVsNHrNRHT4eg6PN
	 0aXGi7S/Y2Pw9JyAv7I9rMxF9D69OmlXv9l4ejznjWjfKX7dVgTNchjdBWWl5uq/SlYt7
	 7E/lHDJz+zF6a2GiMHS/7IMFwk5FapCCVGBM/PZKaLJHgpQhSaGK/MQPEfNNzKk4mNqGz
	 dz/wSNdT74wfU2jOBO8X7Wa2/Et6EgD8uymKq7lIHnyj74Y1L+pFi8LUTdxgLoi0M9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddCy9JWi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED8606A32D;
	Tue, 20 Oct 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddCy9JWi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDA21F000C4;
	Tue, 20 Oct 2026 08:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483811;
	bh=IL/ezpdN5w+pYR3PWaXa2V0Ctgdyc4AXOvpXb4+oGbM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ddCy9JWitnHDZO/lVYfOdqe6FqQZqK/Lrwor35sehBH4ernYh/kO3cjbIvzXzvQ+6
	 0t4DbnO6piOaO+yoKOwQnqFlMfHmUtpaktKYDBFT1wwrjS/2kp2ucfMslbKxvU8n04
	 VjwGhSDPDtnrlR2XfSco7VLRf+gK/8QeWu5EwzJzGgttxu7KMxwbxtk07n/uvd2UX/
	 gLSJcKQfIhNBZR8KZujEh6612ZeaQ6mdoQ53uDpB0wSajWSAtsss0dTwuomHZHK6ZS
	 hIQ77WUcqI09pFilPtMe5u2GgZYSGsi3W6zNJ1FXoD3cZFSAVwQwbswoezVhhSbTV0
	 HaGKGBQM22Anw==
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
Subject: Re: [PATCH v6 01/14] kexec: Fix CMA segment address translation
 with non-zero text_offset
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
In-Reply-To: <20260921090450.807575-2-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-2-ruanjinjie@huawei.com>
Date: Tue, 20 Oct 2026 11:09:39 +0300
Message-Id: <179248377975.302547.13172455257147735569.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> kimage_load_cma_segment() and kimage_map_segment() both translate
> a CMA segment using page_address(cma), which returns the CMA base
> address. This ignores segment->mem.
> 
> On arm64, image_load() adds text_offset to segment->mem before the
> segment is loaded:
> 
> 	kernel_segment->mem += text_offset;
> 	kernel_segment->memsz -= text_offset;
> 	image->start = kernel_segment->mem;

That's true, but since commit 751c263bb74f ("arm64: remove TEXT_OFFSET
randomization") TEXT_OFFSET is always zero. This is upstream from v5.8,
so no LTS kernels has non-zero TEST_OFFSET.

Maybe we should rather start deprecating .text_offset in arm64?

-- 
Sincerely yours,
Mike.

