Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D512B6F
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1689762558; bh=zzi5kjyS7aIx9/ym7iyyPL9XVFwQcOnol4QUS4SlqUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=foB3/ueojPefseN2KuCfAWKwfBnt5yovt63TIp91f1fXhyps1dSO8lCmWRJNE7UAB
	 DkrBPZ62wGj0rusHYsgFtuq+lKLCna8xhWUMSsYxnU/lmsWxZINix9tXWFJ+g4pc5M
	 Z7Gz4wwrO0+65Fi61ht2j2QuN81cdb+UMlwUTckM=
Received: from [100.100.34.13] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3D4D46006F;
	Wed, 19 Jul 2023 18:29:18 +0800 (CST)
Message-ID: <f9e7fb54-a76e-a9b0-1b9c-8c9251f4af20@xen0n.name>
Date: Wed, 19 Jul 2023 18:29:17 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5] LoongArch: Fix CONFIG_CMDLINE_EXTEND and
 CONFIG_CMDLINE_BOOTLOADER handling
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: Zhihong Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Xuefeng Li <lixuefeng@loongson.cn>
References: <20230718153348.3340811-1-chenhuacai@loongson.cn>
 <261edc6c-e339-faeb-3045-bfe6604d1aef@web.de>
 <CAAhV-H5nNMmYZQXvoog85cgMUd+gM2QMaG3cUhYk_iGzjB=B4Q@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H5nNMmYZQXvoog85cgMUd+gM2QMaG3cUhYk_iGzjB=B4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/7/19 15:22, Huacai Chen wrote:
> Hi, Markus,
> 
> On Wed, Jul 19, 2023 at 2:51 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>>
>>>                                                    …, so this patch add
>>> some code to fix it.
>>
>> Would you like to avoid a typo here?
>>
>> Will any other imperative change description variant become more helpful?
> Thank you for pointing this out, but since Zhihong is the original
> author, I don't want to completely rewrite the commit message, so just
> fix the typo...

AFAICT the commit message is totally uninformative even if "an 
imperative change description" were used. It basically:

1. repeated the patch title,
2. spent one sentence only for mentioning a function name without giving 
any more information,
3. mentioned why some change was not necessary due to some other 
existing code, but not explicitly calling that part out, then
4. finished with a sentence that boiled down to "we should do the 
similar thing".

My take:

 > Subject: Fix CMDLINE_EXTEND and CMDLINE_BOOTLOADER on non-FDT systems
 >
 > On FDT systems these command line processing are already taken care of
 > by early_init_dt_scan_chosen(). Add similar handling to the non-FDT
 > code path to allow these config options to work for non-FDT boxes too.

Would this sound better?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

