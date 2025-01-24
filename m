Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA4316191B
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737735007; cv=none; b=Byr3tBmCmmKse4m3ho672Nt+poCgHNBU5w8YKf5+uiKykSPvvNRJEwDTNE4J2WZSEfKrE3hbk/YqrDjOy0Eeitq66HB863EAWNOEN/N/GcXSe0Uitq5fOo7PE82hiAuXl83nUp6XtSzGM2QchHAEuTdnUpy19QPRZ6iIrR0TfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737735007; c=relaxed/simple;
	bh=zc1UgywTcFPUq8vqtsz/S2IsyvUdGPBmwYU7nuQbP9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kwf8bTjlINKWuwuikoLMMlqn91ussJm5FP+L5nwpca0z18eTKPXSYJTuANi4JMGVPILwlMtfAt6z+wUe4gHcOUIL0sAwymoZrlYXUDToY8tUIMGRVijDj1KcquovDdI4ZzbFq8t7V+YrJMj5ysCP6EO/e6IwuQykUTz0XdklK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=Z6HgMWn0; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="Z6HgMWn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1737734993; bh=zc1UgywTcFPUq8vqtsz/S2IsyvUdGPBmwYU7nuQbP9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z6HgMWn0QQMpBHaKpIChipRKXbUysHuCn+BrxFfmL+OdfyXuX9xu3IY2+nn2BTwYs
	 aM3SliEMKYKiOeQkFkPKau9cSduKNBgViNpZPkH+lPU608uZKro0nOx7eq7FoixiEI
	 L92RXkgYF4dULSS4kmHl4xZYvbHAArdiMdF8FKlk=
Received: from [IPV6:240e:388:8d02:a200:2a38:a5d2:3af7:ba8f] (unknown [IPv6:240e:388:8d02:a200:2a38:a5d2:3af7:ba8f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E3C066012F;
	Sat, 25 Jan 2025 00:09:52 +0800 (CST)
Message-ID: <1036be20-7d6f-4066-8777-41f9ea6c53ff@xen0n.name>
Date: Sat, 25 Jan 2025 00:09:50 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] LoongArch: Extend the maximum number of watchpoints
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Xi Ruoyao <xry111@xry111.site>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250121070617.3214-1-yangtiezhu@loongson.cn>
 <20250121070617.3214-3-yangtiezhu@loongson.cn>
 <75b6fec7-f168-4bc3-9479-8a089bb4e033@xen0n.name>
 <42e64433f3255740292d428cf459959430fdc7e3.camel@xry111.site>
 <0943c7f0-65e1-e3bf-97e1-10125c46d316@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <0943c7f0-65e1-e3bf-97e1-10125c46d316@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/22/25 11:09, Tiezhu Yang wrote:
> On 01/21/2025 09:46 PM, Xi Ruoyao wrote:
>> On Tue, 2025-01-21 at 21:35 +0800, WANG Xuerui wrote:
>>> one cannot account for older (in fact, *every existing*) clients
>>> expecting the old UAPI, hence providing a smaller buffer than struct
>>> user_watch_state_v2. In which case the kernel will happily write
>>> out-of-bounds if the client asks for the current watchpoint state. This
>>> is not acceptable I'm afraid.
>>
>> Yes, many distros support running the latest kernel with an old
>> userspace for hardware compatibility reason and the change will blow up
>> gdb on all those distros.  We need to do something smarter to retain the
>> backward compatibility.
> 
> Hi Xuerui and Ruoyao,
> 
> The compatibility problem has been considered when developing and testing
> the patches, when the applications in the userspace get watchpoint state,
> the length will be specified which will not bigger than the sizeof struct
> user_watch_state or user_watch_state_v2, the actual length is assigned as
> the minimal value of the application and kernel in the generic ptrace:
> 
> kernel/ptrace.c: ptrace_regset():
> 
>      kiov->iov_len = min(kiov->iov_len,
>                          (__kernel_size_t) (regset->n * regset->size));
> 
>      if (req == PTRACE_GETREGSET)
>              return copy_regset_to_user(task, view, regset_no, 0,
>                                         kiov->iov_len, kiov->iov_base);
>      else
>              return copy_regset_from_user(task, view, regset_no, 0,
>                                           kiov->iov_len, kiov->iov_base);
> 
> For example, there are four kind of combinations, all of them work well.
> 
> (1) "older kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200;
> (2) "newer kernel + newer gdb", the actual length is 8+(8+8+4+4)*14=344;
> (3) "older kernel + newer gdb", the actual length is 8+(8+8+4+4)*8=200;
> (4) "newer kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200.
> 
> If you have more comments, please let me know.

Thanks for posting the analysis; it was good to know the equivalent of 
sizeof(input) handling actually resides in the arch-independent side.

But next time please just include the explanation in v1 commit message 
to save us many replies back-and-forth. ;-)

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
