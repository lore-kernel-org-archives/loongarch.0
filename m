Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C5D399
	for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1661877477; bh=3tCvRvddQpP82lIcaHbRu8fAaq17w4nPzNxY0aFUxZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E2sgRNYW70PndjaaibTGBxyugpL+RC0LcAJRlOEvREvBMFcAHf/8fYYgLOT1a5UPl
	 Nw+B5HtEq5axBTLVO3Z+XWQKRohnXVLqDjiENKvI6+GrRuqzy42ag5k04lQmAf+eRA
	 jMIzUT7uXg5zWf2QUbdQM7yqJHIYc07tLOlVW37I=
Received: from [192.168.9.172] (unknown [101.88.26.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C40D160087;
	Wed, 31 Aug 2022 00:37:57 +0800 (CST)
Message-ID: <c0ba2e23-5be3-924d-554a-2f10272c05bc@xen0n.name>
Date: Wed, 31 Aug 2022 00:37:56 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:106.0) Gecko/20100101
 Thunderbird/106.0a1
Subject: Re: [PATCH v7 0/5] LoongArch: Support toolchain with new relocation
 types
To: Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Youling Tang <tangyouling@loongson.cn>, Jinyang He <hejinyang@loongson.cn>
References: <20220830104806.128365-1-xry111@xry111.site>
 <CAAhV-H5bH7xZTWLhqcZ_Bmh=RNaEVBy9523hmj-gTmitqqc8ag@mail.gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H5bH7xZTWLhqcZ_Bmh=RNaEVBy9523hmj-gTmitqqc8ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/22 21:05, Huacai Chen wrote:
> Hi, Ruoyao,
>
> Thank you for your contribution, this whole series will be queued for
> 6.1. Though lkp reported some warnings, I will fix them myself.

And of course add my Tested-by:

Tested-by: WANG Xuerui <git@xen0n.name>

(I've run the v6 actually, but there is not substantial change from v6 
to v7 so the status should stay good.)

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

