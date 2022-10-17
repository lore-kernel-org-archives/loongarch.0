Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B5FED4
	for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 05:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1665985774; bh=5DnQWB/mKKYLYR98YTAsbjRRrbuz/m16uNWFy217anw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EDJRFvyO9fTP9nDjAjjfr2jcnbEbqyVmzTdysIPagCekjGahSJFvzT0qgbt5RFeSI
	 XiRftibviwM1BpWNgWM4pQ9g/ZneCn480XZq3ZKOi8KG7Qz9OQKe0UMNpDL1IR3njC
	 8j1slnNpRjCxBNoisynUZQ+9v2eXpf/asYn5835k=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E9B72600B5;
	Mon, 17 Oct 2022 13:49:33 +0800 (CST)
Message-ID: <1df01e31-9d31-e315-4906-d7f1ff9fb6d9@xen0n.name>
Date: Mon, 17 Oct 2022 13:49:33 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH] LoongArch: Add unaligned access support
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
 Xuefeng Li <lixuefeng@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org
References: <20221016133418.2122777-1-chenhuacai@loongson.cn>
 <c1b674a37a1a04f9c84df1e9a227db68bf78e922.camel@xry111.site>
 <CAAhV-H4vGt4MTXCyiSnn7cQFrxR-amLC4nKe7-EcLyT8G-Ciqg@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H4vGt4MTXCyiSnn7cQFrxR-amLC4nKe7-EcLyT8G-Ciqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/17 08:16, Huacai Chen wrote:
> Hi, Ruoyao,
> 
> On Sun, Oct 16, 2022 at 11:05 PM Xi Ruoyao <xry111@xry111.site> wrote:
>>
>> On Sun, 2022-10-16 at 21:34 +0800, Huacai Chen wrote:
>>
>>> Loongson-2 series (Loongson-2K500, Loongson-2K1000)
>>
>> "2K1000LA"? "2K1000" is puzzling because of a name conflict with the
>> MIPS-based model.
> Technically this is correct, both MIPS-based and LoongArch-based
> Loongson-2K1000 have no hardware support.

Unfortunately, no, there is no "LoongArch-based" 2K1000. The Loongson 
2K1000 is a MIPS processor, and will always be; the official model name 
for the "LoongArch-based 2K1000" is 2K1000LA which is obviously distinct.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

