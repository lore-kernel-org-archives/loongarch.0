Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06820A5F2
	for <loongarch@lists.linux.dev>; Tue,  6 May 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537163; cv=none; b=f4egTkFnx6CKXkYnMLsCpClyzOrYmBbRL+pMNvHBks69+Vl44IhCdhbRaEu1gHhrpHPq2zkzeJmfx9FnQ+7n5yqJfjA2O5N7FkLYt5WVRP/2davxm9uKh8n5cQB8Rmi1ib5YFPA7p2Wn9E7BqhfPysGLRcFt25GxG+/WBn627Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537163; c=relaxed/simple;
	bh=WLluURKbm4eGnI6fPXUW+jlJLn5vL0ww++Ei8KhjTqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n7d7jW8ESSjdQ4lCInCJSyjg6Trolvug9Yzji8x7ImzuD0kcI1+wZ8qdawFfqW1Asu5tLitb/kOl8znIohPZDAVFENAbzPrCP/06YJt+WjDtpQ8dMnSpSVZKSpj6Fx0TuwbgC32tcQCwjcqMso2bKKf6pGi1csjlO5nWihkg+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IR10GhDy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IR10GhDy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 026A2403A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746537161; bh=m8AIbhmxSPITdk7Wy5PZ0OjI7Z8rf39QNecnep+a59k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IR10GhDySlD3IFtodkh3Iiciiwj5Q6TYxO3X293u114YIfE2BHgi+c+h2PzLTuzyn
	 jy/A5sZ7XiVneRvAJxHHzFDKuQcHzrbnZUs8C8fUcerorgP7IdbJ8G8LeleT5D54kU
	 +yc0s54sVFG+l0bEcdOWuM1QkqYG9Ctw14RRChqP8sSen23qAN0OEAnqXSFwXgwRKB
	 H53Rb/VuCXdQ8yoGFChoknszcKW6S44N1YPagqZe2Cctv6X+AgOjXVPsj+A7ydmr3C
	 x45eO054b/PWztWYBPbT7VOmuYxcIbu4+azb+Hhp9AMh2SAQukX6tEDwG16fWcLV98
	 0qyzSvfJc03cQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 026A2403A7;
	Tue,  6 May 2025 13:12:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: WangYuli <wangyuli@uniontech.com>, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, bp@alien8.de,
 ardb@kernel.org, gregkh@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, WangYuli <wangyuli@uniontech.com>
Subject: Re: [PATCH] Documentation/kernel-parameters: Update memtest parameter
In-Reply-To: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
References: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
Date: Tue, 06 May 2025 07:12:37 -0600
Message-ID: <87a57px4qi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

WangYuli <wangyuli@uniontech.com> writes:

> LoongArch, MIPS and XTENSA has supported memtest now.
> Update documentation for them.
>
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dce44566192ec0b38597fdfd435013c2d54653ff
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb8e9f59d6f292c3d9fea6c155c22ea5fc3053ab
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d9fd26b95b34..eeba55deb38d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3620,7 +3620,7 @@
>  			Note that even when enabled, there are a few cases where
>  			the feature is not effective.
>  
> -	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
> +	memtest=	[KNL,X86,ARM,LOONGARCH,MIPS,M68K,PPC,RISCV,XTENSA,EARLY] Enable memtest

Applied, thanks.

jon
