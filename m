Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA5F525C
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1678109398; bh=lITNNvdtYsjqw5lqa0YQTU4ptGEenKZNcLXWw4qTE18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UftSwTS/34MZUF5jcucRs9JAODbvtXjZnYKG3wnjL2eA/0G+Trvz/pyAtOOwPazT8
	 hgUBUygRbBGWCehovcnTlyPn9cPwh5HBb4X4UfZ1LvogFyWjfPxyyV5VjtX1eIUY7E
	 SbFp/zITanIah/9KbAdbkTHNMgB9bMprJ9n1Oyq4=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7EE0560B18;
	Mon,  6 Mar 2023 21:29:58 +0800 (CST)
Message-ID: <fbbd1e3d-6554-0d09-eba1-9e432e05746f@xen0n.name>
Date: Mon, 6 Mar 2023 21:29:58 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] LoongArch: Provide kernel fpu functions
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>
References: <20230305052818.4030447-1-chenhuacai@loongson.cn>
 <48f508aa-ab40-7032-a68d-90d8986afb2f@xen0n.name>
 <CAAhV-H55QUrkYYR1Lbj=zbquiz3frX2dNAH23fAuN6eCOUddNA@mail.gmail.com>
 <58cc7e6d19628757d6d8dc192d07876288f6077e.camel@xry111.site>
 <CAAhV-H7vv+AE-7kDf7YpU6_f_dTNxKKoRSHC6vA4aBHOVyMRAQ@mail.gmail.com>
 <65d890c8-9c37-070c-f5c6-db26ab8cfe54@xen0n.name>
 <50dd43063e244fa9a4d025873c862331@AcuMS.aculab.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <50dd43063e244fa9a4d025873c862331@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/3/6 20:53, David Laight wrote:
> ...
>> Also, if the old world is taken into consideration (which we normally
>> have the luxury of not having to do so), consider Ruoyao's case where a
>> commercial partner of Loongson wants to do this with the vendor kernel,
>> but the symbols are exported GPL -- in this case I doubt the GPL marking
>> will remain, thus creating inconsistency between upstream and vendor
>> kernels, and community distros are going to complain loudly about the
>> need to patch things. It's probably best to avoid all of this upfront.
> 
> It is pretty easy to load a non-GPL module into a distro-built
> kernel and call GPL-only functions.
> (And without doing horrid things with kallsyms.)
> As soon as you actually need to do one, adding others isn't a problem.

Hmm, do you mean patching the kernel downstream to remove the license 
checks, or something like that? I remember the so-called "GPL condom" 
trick was banned some time earlier, in commit 262e6ae7081df ("modules: 
inherit TAINT_PROPRIETARY_MODULE"). For now I can't think of a way that 
would allow such reference...

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

