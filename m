Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B15B149C6F;
	Wed, 15 Oct 2025 03:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498427; cv=none; b=JlyWJTXqT12U5vW4Wj88tmRZD5eaJWCCF4NuZ+KfOXlRegPHxkydvE8+KYWp3jxjseahlwG5eTcF90X8MuDszCdLNC1jIFChjxmBDqa7DKBMe2phdzdv6L+M+Y6RP8FOnkE6YgMFgTbPL6jMPoXtDw1+uAXEWmn/xF3v5l7/3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498427; c=relaxed/simple;
	bh=fFWtcqbYqwSuAfaIbZBKUxXweqQB3D5s5ZgdU0zniP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBusmoQs1W1pELNQC5H18JS4WOtunu9J0dK45XRhCa6xMicNgt6ND8D8DK5//RhsTaQW23dbIEziWhCmxpDRtmef0uVygDlN92B0uh4ZD3qoG7ISZVtF+XyfOT49DOHznq/D16jHOLB31zwvr9/MFu9yjz/TXeFakMQRRcs4mbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=qWqRPe6t; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="qWqRPe6t"
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 9E6D22248D;
	Wed, 15 Oct 2025 03:20:24 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 3B97326369;
	Wed, 15 Oct 2025 03:20:16 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 932D03E88F;
	Wed, 15 Oct 2025 03:20:08 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 3EFE740099;
	Wed, 15 Oct 2025 03:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1760498406; bh=fFWtcqbYqwSuAfaIbZBKUxXweqQB3D5s5ZgdU0zniP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qWqRPe6tMkyVt24L4TQxEokd9xxbIlS5nPQZHmqN93YdMm9uG4Vyi2MOpEzAAC5fU
	 yms65895aXhnWBAYzlOyX4+QA5sNOUa+RQ/LRLgLIQuCS7z85svNozjlpvdOT/++T1
	 edWLKoXTE5kAyCqm105Hi4a6rBlFhUWANv7W4VcY=
Received: from [198.18.0.1] (unknown [223.76.243.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 40A7440D62;
	Wed, 15 Oct 2025 03:20:00 +0000 (UTC)
Message-ID: <7ead454c-8807-4e50-800c-5a646d88fa25@aosc.io>
Date: Wed, 15 Oct 2025 11:19:52 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add -fno-isolate-erroneous-paths-dereference to
 bindgen_skip_c_flags
To: Xi Ruoyao <xry111@xry111.site>, Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 "open list:RUST" <rust-for-linux@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20251015022037.14535-2-xry111@xry111.site>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <20251015022037.14535-2-xry111@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3EFE740099
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[jeffbai.aosc.io:server fail,xry111.xry111.site:server fail];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,loongson.cn,vger.kernel.org];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Ruoyao,

在 2025/10/15 10:20, Xi Ruoyao 写道:
> It's used to work around an objtool issue since commit abb2a5572264
> ("LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference"), but
> it's then passed to bindgen and cause an error because Clang does not
> have this option.
> 
> Fixes: abb2a5572264 ("LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>   rust/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 23c7ae905bd2..0676b1194a62 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -289,7 +289,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>   	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>   	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>   	-fzero-init-padding-bits=% -mno-fdpic \
> -	--param=% --param asan-%
> +	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
>   
>   # Derived from `scripts/Makefile.clang`.
>   BINDGEN_TARGET_x86	:= x86_64-linux-gnu

Tested good applied atop v6.18-rc1, which includes the aforementioned 
abb2a5572264.

Tested-by: Mingcong Bai <jeffbai@aosc.io>

Best Regards,
Mingcong Bai

