Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0091FA7
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1664532557; bh=nc5YauIG/pmD3GkaEWFU9ypZGUQcPHtwSFN4m2xVqLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YU0jExXrVyE9e3xeNrBCLuwAyYJU/84yfA1SGLMiic4CQDiiEWkIJHeTetZuVSx70
	 EweaSKSHikh4sgBpZvaKgMrPuVP/wFlkOciBJxtTScEfnPQL7zL1JIlAnw1mhejaA/
	 wehI3Or7eXr/HaCooYm3RrFeyiY8MWCXuYple3yY=
Received: from [192.168.9.172] (unknown [101.228.138.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A7D2B60094;
	Fri, 30 Sep 2022 18:09:17 +0800 (CST)
Message-ID: <7761305a-0fc8-8f32-230a-599087d16758@xen0n.name>
Date: Fri, 30 Sep 2022 18:09:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101
 Thunderbird/107.0a1
Subject: Re: [PATCH] loongarch: update config files
To: Huacai Chen <chenhuacai@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20220929101445.32124-1-lukas.bulwahn@gmail.com>
 <CAAhV-H6xe4o0upxcQTN=8BeDdcDipmoRp+QQNiakJJZ_eneTxg@mail.gmail.com>
 <CAKXUXMwhF4V1=oNq1XaTmQpk_Tt7ZXfZEmK_r_GT6wz7=vVx2g@mail.gmail.com>
 <CAAhV-H4dExTGW7=pSPmunFVBK6YYjj-wo0ZKgfi9A=yHf2qV9g@mail.gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H4dExTGW7=pSPmunFVBK6YYjj-wo0ZKgfi9A=yHf2qV9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/22 10:46, Huacai Chen wrote:
> On Thu, Sep 29, 2022 at 6:44 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>> On Thu, Sep 29, 2022 at 12:42 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>> Hi, Lukas,
>>>
>>> Thank you for your patch, it is queued for loongarch-next, and may be
>>> squashed to another patch with your S-o-B if you have no objections.
>>>
>>> Huacai
>>>
>> Feel free to squash as you see fit. I cannot recall sending something
>> specific for loongarch-next, though.
> Emmm, my meaning is squash your patch to mine and keep a S-o-B in that
> patch [1]. :)
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/commit/?h=loongarch-next
>
Hi, I have to disagree with you in this case, you are mixing multiple 
logical changes into one commit. Although all the commits are touching 
the same Kconfig defaults file it doesn't mean they can be 
unconditionally squashed. Especially when you have apparently dropped 
Lukas' detailed explanation regarding the cleanups with one single 
"Remove obsolete config options" sentence...

As you haven't created the tag and PR'd yet, I'd suggest you fix the 
branch and just make the commits separate. At the very least please 
don't delete Lukas' link reference regarding this round of overall 
Kconfig cleanup effort.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

