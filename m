Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A5320A
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1679560953; bh=6IwNYpvP7OSLnQJrS+6XmBJZkjMNYdYofHK/90bzuvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VpWp1lDmicmIji3ixOOY8SFqlbvzFoZm1rXaBN41upBSlOJXagJ27LgcK9MYBUWS5
	 PWgTTyKwmsLQCh76FnKsyp+9YaoG8KCx8fzR0v6TuOJboa6g9nxr+93U9NRx70kHD2
	 fSDlR6ctBiiO+tl5Gg52W9wBJjsbKt33y5RVJI+Y=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8B4AE600BD;
	Thu, 23 Mar 2023 16:42:33 +0800 (CST)
Message-ID: <6f9a4b9d-9aff-c438-5858-f9cd437f25b9@xen0n.name>
Date: Thu, 23 Mar 2023 16:42:33 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, Enze Li <lienze@kylinos.cn>,
 chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
References: <20230322090533.4079453-1-lienze@kylinos.cn>
 <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
 <df8b7ec01580cb1ea825a409b53155121f44754c.camel@kylinos.cn>
 <793a6d0f-fc79-ffd4-856f-9dff6e431352@xen0n.name>
 <a4def33dc74f5e384f32af970c3c0cef2dd72ab0.camel@xry111.site>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <a4def33dc74f5e384f32af970c3c0cef2dd72ab0.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/3/23 16:37, Xi Ruoyao wrote:
> On Thu, 2023-03-23 at 16:32 +0800, WANG Xuerui wrote:
>> (I had talked with Huacai about the field keys but the conversation was
>> private & in Chinese; I was actually proposing all-lowercase keys but he
>> insisted on "mhz" being "incorrect", then as a result he had to Title
>> Case everything else because of *aesthetic reasons* which I didn't and
>> still don't agree with. I later criticized him because he left
>> "processor", "package" and "core" lowercased, but he never gave any
>> satisfying justification nor backed out the change, so as a result we
>> are left with the current situation. You can say anything, but as a
>> matter of fact, the ship has sailed.)
> 
> If I read some comment in linux.git correctly, it seems the code
> calculating the number of processor cores in Glibc would blow up if
> "processor" was changed to "Processor".

Ah you're probably right. At that time Huacai noted difficulties making 
"Processor" work which were not possible to work around, so he had to 
keep it lower-case. If not for this reason, every loongarch cpuinfo 
field would be properly in their respective Canonical Case (honestly 
that's not gonna be a bad thing).

> To me it's a mistake from day one making all the userspace parsing
> /proc/cpuinfo, while it's clearly more "human readable" than parseable.
> Perhaps the "correct" way is adding "/proc/cpuinfo.toml" with a well-
> defined spec in Documentation/filesystems/proc.rst.

Yay for alternative machine-readable representation of de-facto 
information source; actually getting a proposal past the bikeshedding 
stage and pushing it past the finish line is another thing though. ;-)

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

