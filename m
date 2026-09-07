Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5564CA76C
	for <loongarch@lists.linux.dev>; Mon,  7 Sep 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796037; cv=none; b=XnT6sAZjrfjmVpLq8L6mz2lXnBTL/ea+SgfKHzTpjuo8ALjLwehf7OXmfF/kdhb77tLS5XMJuE77LQ3Q13J1JEiSbg04lOiVCdn2WIvBJp1DmJDtYRC/h6Dr7691cA8gHSapt/Jup/MU9HiTcH2U5wqx23iGDqY+xHE0+UCxCH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796037; c=relaxed/simple;
	bh=AH264vI/aknVYSTW99NcUY5uWVwpmfhh4Zn9R6RwR9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mGSh7DkfbRiMjhw9FsBPyZaI1bJ2IP/7/GslH1MWJF8AC9ZJoAL1iLV1zLpxiUpsCKN3iST7dHLHuuwMB2/aVXxG4ujBwaYwufFXNx7v0tLVzVqei7GCCLOWRbS2hyBHN+Raz6TcYHnTNeiutW+wa+mQhC/zR6Pm81e9LVsW2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Rtrc++O2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Rtrc++O2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 33B37408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788796035; bh=bGlSRA/WLz90CFM4oVemXVQvPUqpZWz2JmqeHXSSRRg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Rtrc++O2DWi4J5+8GiT6eXiZV/IYZSMcTW72ZAS6EAM0f8+diER+gPtP9Vcibby7M
	 0s4+7qnrAO2r7latXxYOkBhDy90WFlm9ctUdx0CzQChyEyqaE3cAV1niPRrH50gbLP
	 KzrHCGzVFsCMhTjU9m5dJLAHp1jJrcTGuSHmy6tjhPQTpSu1eGiJL55vdx4xfZIzSu
	 FZ43KQ4eZjVBbYP970OgNEKQYR5Qy85e9bH3MUtkI4R3Vs7YWgwkLY6sPcwbmyCs2A
	 UrxMYAhG0GierhVt9s2CFLhyPfehthSw9lf5jZAUrFUGINgCWNTUkN6ln65XjFgjCB
	 uB3BAsem7qtpw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 33B37408FF;
	Mon,  7 Sep 2026 15:47:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH] Documentation/features: Mark cmpxchg-local as supported
 on loongarch
In-Reply-To: <20260905091743.41006-1-kmehltretter@gmail.com>
References: <20260905091743.41006-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 09:47:14 -0600
Message-ID: <87y0ddvzb1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> arch/loongarch/Kconfig has selected CONFIG_HAVE_CMPXCHG_LOCAL since
> commit 07d5798aadfa ("LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig"),
> but the feature matrix still lists loongarch as TODO. This is the only
> cell in Documentation/features that tools/docs/features-refresh.sh
> changes on today's tree.
>
> Mark it ok.
>
> Fixes: 07d5798aadfa ("LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
> index 2c3a4b91f16d..127e8159adaa 100644
> --- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
> +++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
> @@ -12,7 +12,7 @@
>      |       arm64: |  ok  |
>      |        csky: | TODO |
>      |     hexagon: | TODO |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>      |        m68k: | TODO |

Applied, thanks.

jon
