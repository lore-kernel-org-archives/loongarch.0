Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C129BDA9
	for <loongarch@lists.linux.dev>; Fri, 24 Oct 2025 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761289675; cv=none; b=tJAdoG9sxXZEkH7tJ92W2Xh576oHPwO6duufpt1bJbAJCh5R5tqnvUVjQuWdSRJQM/31ADPAzsaZp3lUFgtb51HVZ0MXWRZu7BxIRqF5JwrWXx13TkEp1NFu86gef5oAExFeBc7GIXdWH7yuu4KSracB0/CZnXg4cmM169TW+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761289675; c=relaxed/simple;
	bh=BNniUyI901wXBDIZRDj//iLWjluNXPc/huJRB/20Imc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv7nEoeH0L8XWtBHpccjgc/z6Y00jwV3p3cY/sYctpM/xXyCUm7uGzKJRktljH3KrKpRmt9WkLxM/pyDxuaMzh+rf9iFv6+gkJ4ch+IAZWwsywLgyfKeN9Y1F1oCu2erdtZ8brg9KZoG1GO5flnWCuBsDyy1dsUqRrrkoVNsH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cIRh5nFO; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cIRh5nFO"
Message-ID: <d327af2b-8089-4d1b-8f7f-9f18c0d9faba@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761289671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJpu9jNeG/9AHqtuVmrf1mdpbO23IJsdx1yWPp+AZv8=;
	b=cIRh5nFOYHb6pF8W1pDgnMpBx3yfZ+vT+k8OKL4renNzvsbG3YwZjaVL2tEjNRluaJMKZt
	noGOXGtoSBhgmWSOrdo3DdHFZjsXW4A2dU1CwLkyZkVCCTn9c68E5sIzJoZS7HJD0eHa5W
	pL693ktqobj4sgZBoAIMN7pEIyeAmsY=
Date: Fri, 24 Oct 2025 15:06:56 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: kexec: Initialize kexec_buf struct
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kexec@lists.infradead.org, Breno Leitao <leitao@debian.org>,
 Youling Tang <tangyouling@kylinos.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251024063653.35492-1-youling.tang@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <20251024063653.35492-1-youling.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

cc to loongarch@lists.linux.dev and linux-kernel@vger.kernel.org


On 10/24/25 14:36, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
>
> The kexec_buf structure was previously declared without initialization.
> commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> added a field that is always read but not consistently populated by all
> architectures. This un-initialized field will contain garbage.
>
> This is also triggering a UBSAN warning when the uninitialized data was
> accessed:
>
>          ------------[ cut here ]------------
>          UBSAN: invalid-load in ./include/linux/kexec.h:210:10
>          load of value 252 is not a valid value for type '_Bool'
>
> Zero-initializing kexec_buf at declaration ensures all fields are
> cleanly set, preventing future instances of uninitialized memory being
> used.
>
> Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> Link: https://lore.kernel.org/r/20250827-kbuf_all-v1-2-1df9882bb01a@debian.org
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>   arch/loongarch/kernel/kexec_efi.c          | 2 +-
>   arch/loongarch/kernel/kexec_elf.c          | 2 +-
>   arch/loongarch/kernel/machine_kexec_file.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
> index 45121b914f8f..5ee78ebb1546 100644
> --- a/arch/loongarch/kernel/kexec_efi.c
> +++ b/arch/loongarch/kernel/kexec_efi.c
> @@ -42,7 +42,7 @@ static void *efi_kexec_load(struct kimage *image,
>   {
>   	int ret;
>   	unsigned long text_offset, kernel_segment_number;
> -	struct kexec_buf kbuf;
> +	struct kexec_buf kbuf = {};
>   	struct kexec_segment *kernel_segment;
>   	struct loongarch_image_header *h;
>   
> diff --git a/arch/loongarch/kernel/kexec_elf.c b/arch/loongarch/kernel/kexec_elf.c
> index 97b2f049801a..1b6b64744c7f 100644
> --- a/arch/loongarch/kernel/kexec_elf.c
> +++ b/arch/loongarch/kernel/kexec_elf.c
> @@ -59,7 +59,7 @@ static void *elf_kexec_load(struct kimage *image,
>   	int ret;
>   	unsigned long text_offset, kernel_segment_number;
>   	struct elfhdr ehdr;
> -	struct kexec_buf kbuf;
> +	struct kexec_buf kbuf = {};
>   	struct kexec_elf_info elf_info;
>   	struct kexec_segment *kernel_segment;
>   
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
> index dda236b51a88..fb57026f5f25 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -143,7 +143,7 @@ int load_other_segments(struct kimage *image,
>   	unsigned long initrd_load_addr = 0;
>   	unsigned long orig_segments = image->nr_segments;
>   	char *modified_cmdline = NULL;
> -	struct kexec_buf kbuf;
> +	struct kexec_buf kbuf = {};
>   
>   	kbuf.image = image;
>   	/* Don't allocate anything below the kernel */
