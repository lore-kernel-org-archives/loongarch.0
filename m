Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483839;
	b=CRwAW9Nsev9fW3rcDa7YipoQMzMMmoPK+kl7A8+H6mpFNxLiEgE4FxGw6aD3MGiJ2Ydv
	 RY+jpf/YGTmsaAKWJ5kHvAZ6MO4j5l2UL/TlALhlkCnlciMuIdOPjnCbmW0LFcHFkM6lT
	 dT3s+hxqCEXf7S/wsAP/qCD2hQlm5qVTipQ1tMZsS2MqFznJZcgZrtxyefA5xHD6UaYJZ
	 dw9d3qKNBu1TjCmF/bVmxC0Oqw1Ux07jDnUl2mlqNu33oryGPOd7zss9QjXGJGtXVQi5t
	 yygDBXr1Q1p09gL3dYyAvY5QzNouenGhFNS0DUEZwXZzWqiDBAohDttmkZnVhxA4Ytg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483839;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=qE6OXYMZCNhpTVqGUe213qDW93yxbpeyhbeKhLS4ZJQ=;
	b=UeySqhhUQ96YuulBgPHRXrJK+NWXf/BuZz+/TbZW2WyjZicz6z+S6L7p99CJJf21ly0+
	 RUnDLu/NcNfj/dan2YdrSc6Pu2sk8vQ7JJiqjfWCPIg9uaH5j5uFtdFP1DTn1PLtl5ceK
	 PqQuVpJOmgKmaDDbKbhjcsBOsg1Zp3qtOKA6gyIpGLWLl2n6KtVCc9b/DI3xcfcuXLgrL
	 Kc/BCsKB35bePF1xZuy9FZCLdMMXJqk1zytTz0r6dtnAYCFkbqcyk8YpKQtB0X/uT+6UL
	 pOKQ9bCtFrAAZiDCuy2JJUG0R5EB7FFJXJFttGjF/wCb9fcnsdZZT0Z81e3iKwhq2wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzyGO92R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EED606A321;
	Tue, 20 Oct 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzyGO92R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FC41F000C7;
	Tue, 20 Oct 2026 08:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483839;
	bh=qE6OXYMZCNhpTVqGUe213qDW93yxbpeyhbeKhLS4ZJQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IzyGO92Roy0DLQa95pMkJ03Bsx6UAwYJ9RGvSlTqTRAN5PpmHyGaPT0JR/f6L2Gqs
	 Q7DLgOTXUy3kHWVjtLJhTqjualhaQ1wu+ge85rzJEHCMK8KDS3daees6n7Ec5J6IyW
	 EK2hsFBuOeriYkFpDN3PJeTEIDYoNI3CcC/GFyPYdIPcVzgT6G1+FSPBq2Lv0jmSh2
	 AUkAFSkHj1F6OOlyiafKVljw4qbKhWr7KG0+Jkv9LQAs/393EOwra7DqAiXyB7U27t
	 Ud66NV0Hiv+XPejPYXfQRJKi8lofyLyoH7kNkBaIBpjUFCfpS7M2yDHuDCXiAzh6rF
	 IQn8Ye8g66exw==
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
Subject: Re: [PATCH v6 04/14] arm64: kexec_file: Fix CMA page leaks in
 segment placement retry loops
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
In-Reply-To: <20260921090450.807575-5-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-5-ruanjinjie@huawei.com>
Date: Tue, 20 Oct 2026 11:09:39 +0300
Message-Id: <179248377975.302547.8678981752345638279.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> During kexec image placement retry loops, any midway failure causes
> the loader to truncate `image->nr_segments` back to its initial state
> to purge the failed segments.
> 
> However, this truncation introduces a memory leak. The CMA pages
> allocated via kexec_add_buffer() during the failed attempt are tracked
> in the `image->segment_cma` array. Because the subsequent cleanup paths
> only iterate up to the truncated `nr_segments` boundary, these allocated
> CMA pages outside the new boundary are permanently leaked.
> 
> Fix this by explicitly releasing the associated CMA buffers in
> the failure paths before `image->nr_segments` is reduced.

I looked and how load_other_segments() implements error handling and it
seems it really needs more than these fixes.

It does not really follow "all or nothing" and it's use of "goto
out_err" is quite loosely coupled to actual error handling.

The same applies to LoongArch.

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 07d24902977e4 ("kexec: enable CMA based contiguous allocation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/kexec_image.c        | 1 +
>  arch/arm64/kernel/machine_kexec_file.c | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
> index b70f4df15a1ae..ffcb7f9075e62 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -107,6 +107,7 @@ static void *image_load(struct kimage *image,
>  		 * We couldn't find space for the other segments; erase the
>  		 * kernel segment and try the next available hole.
>  		 */
> +		kexec_free_segment_cma(image, kernel_segment_number);
>  		image->nr_segments -= 1;
>  		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
>  		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;

Sashiko comment about turning the loop into an infinite one seems valid
to me:

-- 
Sincerely yours,
Mike.

