Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D8405AB2
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364973; cv=none; b=NjHmQ7HAJphIFZVE7C3B3d82GGc7i3fiH+fxvQGu81Quy0Zrd01AAcuYvVn/9iXB3j//pnarQzCc1nFUoBzEUIF+GUCDUf5uBU1+L06nYntXJqbOBuuS2ClWpKmGl7/LJrUmGk5XQUrgBHjhPxR6yyG5qViLgxcRaOj97J69zc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364973; c=relaxed/simple;
	bh=PthYN7ZDHdFN5gfjhbdxfUe6mL8LcV94U3JEbrUoojA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBmLYefvTKjqCcQSiOrtf83zGxgrjRDayAy2lze9vjgOz5F1A+nTD5QrBLKpPAOJFk7Ef2kAiXw9ALf0/0jkOt377Jrj3kBVqEiyUoo1zq+py652XGwnknPLX7w3/I/Dh5ORM3ZW3oIB+SmocFhbfTK3JKdWjVa3As4ArD0C9Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EkUEwjFR; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EkUEwjFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774364959; bh=e9xnOTqNCRvXtxsnWHt12COZRGCZXi00fDF44qtgmso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EkUEwjFRMpEBF2UfsWT8Q5JazP6WRKz9L5ul+ei5mPZNBAK4XHOlycJ+2YNrrhUup
	 i3deVLnjw96OnD96EXJNnsTxIQqF3yb4A8Xi0mYbCWlt2vK+eP5wCK4xReGyKr/F9Q
	 mWKj1X6+vHe3CY0ll2zvpZ+6fk6qkthYfsoNQoh8=
Received: from [198.18.0.1] ([122.195.139.226])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 2508FC67; Tue, 24 Mar 2026 23:09:16 +0800
X-QQ-mid: xmsmtpt1774364956tdve4h219
Message-ID: <tencent_414FBFBEE2A4510232AB52CE665C04A6C20A@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GeQclGkH9eitL8lbyOBv7J4IRM8kAAGVi5JQRFwlvdUtT1qFu8E
	 bTAxcj9h0QEMyUT0l6OYmqZJrRpV7QjwPNqTWORIu/+QRCwS4iJhil0i9qPoPP0nBNzZjercPHJ9
	 f6CV/HAyQ0cDxnyqFHheZuc4YUmzrxXC7hTR68FPmm8eVqiZ+sY3CzuT1qm0vsKMsZTdD/RAM7JT
	 +94/PsFodquVzFqEz6USf+Q14jVxoGLlw7cYsPv/uBSbpGv8834wAehKR+xMks6owF8A9kWtE+Ng
	 afL/fSKU+QYRcm5LbVOGT/yUO92KKC8h0msqTEMuo7EXXtRU3Hf2sB+lt0ZlQlNswk4P/EbJz8xc
	 vUlOV70Vecv56f5QSxiEqtQCN6WMt8nJEVkVcgqWK7a4QeruVLTnp0PZtuQcQ08aLRP0KKahuBNR
	 n5XfgjL1+t34RIYndU7WwgreX76+PSEofJbVoi9DlC+ml6lhyScLdgIrtDN+pAcaAByUG00WmqEc
	 qqtTmcYcqxSYEbgkKfXB71IJ32LfuTsCQ9ji6wR2R6kX2LL0j1alEYG2zuD84DB3JNGq6RVC2+JA
	 cgdQab6uNDb3g1WKCj7EQzzmF4QEsQAG9j054uNlrRQ7d5OOAsU23HQiVKPPLDjryW5Gv48cNp3/
	 q/UUvoiq4z5hZ9Gdzqk00FKon+GY/iivqvowW0SFiYPKyJ5KtD5RwFjsnowZjOCurDk5NCWhn/+b
	 2900LErc380U9ih9A0/SUyxiSDbwXu1CXRCfSW9YzjFwKm/rq3f/dUUbrfO5KQnOJv+C2rwFB5ZJ
	 KmOGYlTq76QvTxhea8H9bm5OT1JgZiHzDw+H/r1XhM5a/Z5jQp7jDT2fbplHucBOCVrlZCyCKW4T
	 aQyew0h4Sx/47j4fePcAinXHTBXIuavR6OxqwH7rYMHXgc7ibmMEVqjNbOiqsxjcMzoNtt67m8IY
	 CDjxutMfRKbHiQK60uwF4vPpQR7ylFqut5YTaDmOgB5JxfnOt4j2hvxRaNVEb1RjHIPpJUzcfkcG
	 dfbBqhTGmDxhqoZ+vNkwH+AU4ND8ctgm2oUPMG4gtGiEB35o3cygO9j2v43ng=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-OQ-MSGID: <c3f679a3-8916-4fee-9042-3ef0c5ae0590@qq.com>
Date: Tue, 24 Mar 2026 23:09:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add Loongson-2K0300 processor support
To: Yao Zi <me@ziyao.cc>, Huacai Chen <chenhuacai@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 kernel@xen0n.name, devicetree@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, wjjsn <2858482031@qq.com>
References: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
 <ab_iF2hjZRfp16HP@pie>
 <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
 <tencent_CA7176E8823B957F1AEB15254D17904D5505@qq.com> <acCoo_ZrTmZGZH5d@pie>
Content-Language: en-US
From: wjjsn <wjjsn@qq.com>
In-Reply-To: <acCoo_ZrTmZGZH5d@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 10:42, Yao Zi wrote:
> On Mon, Mar 23, 2026 at 12:33:31AM +0800, wjjsn wrote:
>> On 3/22/26 21:15, Huacai Chen wrote:
>> 1. The current clock driver in mainline has some problems.
>>    The pll_ddr is lower than the user_manual,
> 
> I'm not sure what do you mean. Do you observe lower clock frequency of
> pll_ddr than the frequency specified in TRM (1GHz)? And if so, how?
> 
> clk-loongson2 doesn't have the ability to reclock hardware, but only
> read out the frequency. PLL frequencies are all up to the bootloader.
> So as long as you could confirm the values returned by recalc_rate()
> match the register settings, there's nothing wrong in the clock driver.
> 
> Reclocking functionality could be introduced later. But even with
> reclocking code, I doubt whether the DDR clock could be reclocked
> at runtime since it supplies the memory controller.

I observed that 'clk_ddr_div' operates at 800MHz instead of the 1GHz 
specified in the manual, and 'clk_dev_div' operates at 100MHz instead of 
the 200MHz specified in the manual. However, you mentioned that these 
settings are determined by the bootloader, so everything now makes sense

>>    the clk_apb_gate will
>>    turn off by kernel while booting,though 16100000.serial is using
> 
> This is unlikely an issue in the clock driver, but rather the consumer
> is doing something wrong, though I haven't seen similar issues when
> working on the clock driver.
> 
> Please try booting the kernel with clk_ignore_unused, and check
> /sys/kernel/debug/clk/clk_summary to see whether the serial correctly
> acquires the apb gate clock. If not, one (and the most possible) reason
> is both clock-frequency and clocks properties are specified in its
> devicetree node, where 8250 driver would ignore the latter.
>

  When I use 'clocks = <&clk LS2K0300_CLK_DEV_DIV>;', the system log 
gets stuck at the message about closing unused clocks, and there are no 
further logs. It seems like the clock for the serial port is being 
closed. However, if I set the parameter to not close unused clocks as a 
startup parameter, the serial port can continue to be used. If I use 
'clocks = <&clk LS2K0300_CLK_APB_GATE>;', then the clock for the serial 
port is not closed and can start normally. I have not specified the 
clock frequency in the device tree

>> 2. eiointc support for 2k0300 is missing.
> 
> This is expected. IOCSRs found on 2K0300 have a quite different layout
> than previous generations of Loongson SoCs, and EIOINTC is in fact a
> device located in IOCSR addressing space. We need to come up with a
> better way to model the IOCSRs in devicetree, and it hasn't been done
> yet.
> 
>> Is there any WIP (Work In Progress) tree I can follow?
>> I'm happy to help with the development or testing.
> 
> Sorry there isn't one for now. I'm currently out of my lab, and could
> only get things updated this weekend. Sorry for the inconvenience.

Okay, if you have a public repository, please let me know. If I have 
time, I would be happy to help with testing

Regards,
wjjsn

