Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5799C3A2576
	for <loongarch@lists.linux.dev>; Wed,  8 Jul 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538308; cv=none; b=jNOkEeUeP5/SAM8wSkypEhNR1Y4H/pJmne4lx7xLbA1ewuJNbqdJU22eDHqLqcKdXHyAevkdY637ZRCO41BukLkistdM4p4bihlYnt8K3BCcurTvBei9Jg5WdSoPIC7Qghhg368id0VvysuFvdJ5tekE2dLBVxyode2kOADiy+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538308; c=relaxed/simple;
	bh=Nuobs42GWN9jY9nFDEzqJGYWYg8zA3CPFZD6afRvhWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mxgG7PJxoZI0P8JvUxlJmxTbXXxZiK4pQ62q5oBCZ1zM4mffvuuLlhc3rlFcEbCpy0MtlLlod+Pj4KCgKoQ+nDsQZdqvAplbsfbO1dGSyv81y5KHD+oXxfNs6cTRp0Bn8235J3t7vwltiTYYWYKyAf4D6P/ykRemChjvyTjVeJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8e0M+aR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8e0M+aR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783538306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvzY/mZGKEJx6zIsYvZa88M0P3VBfNQj1yFZq68GFbc=;
	b=B8e0M+aRiW5j0+e0JrAYCPlgv3zD9MTbbguoqLpu5jIz05WoFJ2806UYEs8YBp4HgpR16u
	xIA0KC6CibkjTtPb6vs83V42GDMSIcSz6QBf4xFph6NMJ2DOOykN4VsBKPrdfEVjhxvW0l
	ASGmbA6rcWOEHoaGlpIFDtniMIro/vE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-Ks6cFFghP2WYJsger330qw-1; Wed,
 08 Jul 2026 15:18:19 -0400
X-MC-Unique: Ks6cFFghP2WYJsger330qw-1
X-Mimecast-MFC-AGG-ID: Ks6cFFghP2WYJsger330qw_1783538297
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 565A91800615;
	Wed,  8 Jul 2026 19:18:15 +0000 (UTC)
Received: from redhat.com (unknown [10.22.80.46])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB6591800370;
	Wed,  8 Jul 2026 19:18:09 +0000 (UTC)
Date: Wed, 8 Jul 2026 15:18:07 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
	jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
	kernel@xen0n.name, rostedt@goodmis.org, ardb@kernel.org,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn, jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn, guodongtai@kylinos.cn, xry111@xry111.site,
	wangyuli@aosc.io, loongarch@lists.linux.dev,
	live-patching@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/12] klp-build: Add LoongArch syscall patching macro
Message-ID: <ak6ibxwACKMK8it2@redhat.com>
References: <20260707072031.231066-1-dongtai.guo@linux.dev>
 <20260707072031.231066-8-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260707072031.231066-8-dongtai.guo@linux.dev>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: LZFSm4aXDWLmpXo2z5dEvCv6og0o3U868Rt0ATrUBzU_1783538297
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2026 at 03:20:26PM +0800, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> Add LoongArch support for KLP_SYSCALL_DEFINEx(), mirroring the generic
> __SYSCALL_DEFINEx() pattern from include/linux/syscalls.h.
> 
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  include/linux/livepatch_helpers.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/livepatch_helpers.h b/include/linux/livepatch_helpers.h
> index 4b647b83865f..a8aad067177b 100644
> --- a/include/linux/livepatch_helpers.h
> +++ b/include/linux/livepatch_helpers.h
> @@ -91,6 +91,28 @@
>  	}								\
>  	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
>  
> +#elif defined(CONFIG_LOONGARCH)
> +
> +#define __KLP_SYSCALL_DEFINEx(x, name, ...)                             \
> +	__diag_push();                                                  \
> +	__diag_ignore(GCC, 8, "-Wattribute-alias",                      \
> +		      "Type aliasing is used to sanitize syscall arguments");\
> +	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
> +		__attribute__((alias(__stringify(__se_sys##name))));    \
> +	ALLOW_ERROR_INJECTION(sys##name, ERRNO);                        \
> +	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
> +	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)); \
> +	asmlinkage long __attribute__((optimize("-fno-optimize-sibling-calls")))\
> +			__se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
> +	{                                                               \
> +		long ret = __klp_do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
> +		__MAP(x,__SC_TEST,__VA_ARGS__);                         \
> +		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));       \
> +		return ret;                                             \
> +	}                                                               \
> +	__diag_pop();                                                   \
> +	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
> +
>  #endif

Nit: The other macros in livepatch_helpers use tabs to pad out to the
line continuation '\'.

--
Joe

