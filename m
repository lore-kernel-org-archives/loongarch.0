Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC21FCE
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 08:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1688891105; bh=zvv2emV6eEdWIRXkSwuSKOvnUU2K4NnExPBuJb19zuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kKITEi4t9sa18kzx+jWxQav15ikjA2V2Sydnmzh9EjiW3qpXRQQdNwvw9t9Xyaa8/
	 3+d8bNbknrzT5eue23zJBVmUI16jZ0FBT7+G+Opq1yUL50KALGkwnLAwAgqlXPy6VK
	 smRT3nS1csCYdr9j32gUxl0M59w/Q5eZci6ZMmsc=
Received: from [192.168.9.172] (unknown [101.88.28.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6FF9F6011C;
	Sun,  9 Jul 2023 16:25:05 +0800 (CST)
Message-ID: <d25795b3-23a0-6ce7-a047-c82afefab89a@xen0n.name>
Date: Sun, 9 Jul 2023 16:25:05 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] loongarch: Fix broken CONFIG_CMDLINE
To: donmor <donmor3000@hotmail.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
References: <3ddf48d97c90e4203e328180763a0d8124890216.camel@hotmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <3ddf48d97c90e4203e328180763a0d8124890216.camel@hotmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/23 16:12, donmor wrote:
>  From e00182944fee67301c3ebade3147b25d9f1555aa Mon Sep 17 00:00:00 2001
> From: donmor <donmor3000@hotmail.com>
> Date: Sat, 8 Jul 2023 10:45:21 +0800
> Subject: [PATCH] loongarch: Fix broken CONFIG_CMDLINE
Please use git send-email to send the patch.
> [snip]
> +	 * If CONFIG_CMDLINE_BOOTLOADER is enabled then we use the
> built-in
> +	 * command line if no command line given, or we append given
> command
> +	 * line to the built-in one if CONFIG_CMDLINE_EXTEND is
> enabled.
> +	 */

Note how your mail client corrupted the diff by applying its 
line-wrapping logic for you when it really shouldn't...

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

