Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A21374
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666790859; bh=3ejE4L3fwNSToRFYb0YslC/TsKHy6FFSXGUoLdwiKOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDHsllv1u7ddxqr+prHR+wQ2amFOBA/LnLHmb/Q9x+C5J0qDwkvLubvkBmV0o5j44
	 HZv/YuCA/PmQrJ/nzXm+k9z9rkewmnmbrDcNBcvFC7bH8CVsY2xUfEzsZQE4/TbhMh
	 1uh/ylQwdzfUWZUjlGS1NKTokMIluywZNhQ5F0f8=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 872DD600CF;
	Wed, 26 Oct 2022 21:27:39 +0800 (CST)
Message-ID: <78b76ffd-f668-239c-eb97-654bbe6eccc0@xen0n.name>
Date: Wed, 26 Oct 2022 21:27:39 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:108.0)
 Gecko/20100101 Thunderbird/108.0a1
Subject: Re: [PATCH v2 RESEND] LoongArch: Remove unused kernel stack padding
Content-Language: en-US
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221026035501.11986-1-hejinyang@loongson.cn>
 <43126fe8-9040-a574-a149-273844d3073f@xen0n.name>
 <26a42f0c-db3b-9330-de5c-68bf44976201@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <26a42f0c-db3b-9330-de5c-68bf44976201@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/26 21:24, Jinyang He wrote:
> Emm, to be honest, I didn't do tests like LTP. I ususally do development
> on CLFS-LoongArch while kernel has this patch. And it works normally.

For changes touching fundamental parts that make the system work at all, 
like this, "it continues to boot and work" usually is enough for 
confirming correctness. Although some harder test runs would certainly 
be better ;-)

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

