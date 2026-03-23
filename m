Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F5E18FC97
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 02:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774233786; cv=pass; b=SV/Mkg9zvFjcxC8iWYVkgdjmJV6T+cCmO+9lL4FQ/CAc8aH+nISZ57TxbT/9ri9x2Tg9UJzW/wj2bFhXzKLIngpFpNgPRH28k7/23dcFrnffps7Qxjjiv69PbmN44LneRs0uB5Wmc6y+vqO+67CgpiCgdiSzTyrmqGiouVb6juo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774233786; c=relaxed/simple;
	bh=QqyZpjetCJfsjyZ/FxYtpAd7wg+mlZUD1PL1rZnnq1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phrP8AYKdOnBRL2lA6WV2Q2Wp/nGD1jczadWg2tct6IseTokRuSKY8rXQM98ppPOmGzv1aS+TxGVs34aFZugMBW6f7iSTWWQad8gi5oDXnimzCxs5nRsZywHF2DZs5l0Cgi6siXpV7CF0OoDO0zR6n9ijSFSx7CaotJ91m2If7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=D+omvC98; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="D+omvC98"
ARC-Seal: i=1; a=rsa-sha256; t=1774233783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dwdDcciO8qNqhMWQE5w02SAUFe4O5gzD8ZNaCrEGYC72m7fXt3N8+5DnrUMOa1ke5vQsiEa6Qba3WBX2GnaHM847ZV5uWT2rlekor/aIJX/u7qCVRbJfyEKtWE0c7xhM+Y9pGDpS5jLmRw9Gbiqui8dehBmf98/BiuZuWvDQTGE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774233783; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uQ2/dccpS285fxSXG2M5oOHPmXAP3bXWSivn6WYs4QU=; 
	b=SjFYXnoV6mTtueF3RsXmpogjEoQBsjuwS5mmNrwAG91AkaNMAVqun8N4+q7BrJKeedf9OaGj69hNkJl/JX0oH/ftBySzNlP0w0DyiYGRfM/LaPG5X95SCZfOTOfV7B9wUsDE9ZHpsK7ij9XI6d1RizOpZWb9tVR96sBFnqSZw5I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774233783;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=uQ2/dccpS285fxSXG2M5oOHPmXAP3bXWSivn6WYs4QU=;
	b=D+omvC98vt6dOeavD5Rfkm3lCv4zucMbOsoSrmMg7Lb4JnmA3rd72vwKRKYGXkfi
	jAOWAoquge+A9Jv+jZ7wYt6AUhjIuB2FE4niMpY4pJHOB/5ffHgE0MV09gD3WAsvCT1
	MyYlyXrI3AdpvR6WNr0nsi2BE1NgM7+PepApDhLs=
Received: by mx.zohomail.com with SMTPS id 1774233780465105.06160521696256;
	Sun, 22 Mar 2026 19:43:00 -0700 (PDT)
Date: Mon, 23 Mar 2026 02:42:43 +0000
From: Yao Zi <me@ziyao.cc>
To: wjjsn <wjjsn@qq.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kernel@xen0n.name, devicetree@vger.kernel.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	wjjsn <2858482031@qq.com>
Subject: Re: [PATCH v5 0/2] Add Loongson-2K0300 processor support
Message-ID: <acCoo_ZrTmZGZH5d@pie>
References: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
 <ab_iF2hjZRfp16HP@pie>
 <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
 <tencent_CA7176E8823B957F1AEB15254D17904D5505@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_CA7176E8823B957F1AEB15254D17904D5505@qq.com>
X-ZohoMailClient: External

On Mon, Mar 23, 2026 at 12:33:31AM +0800, wjjsn wrote:
> On 3/22/26 21:15, Huacai Chen wrote:
> > On Sun, Mar 22, 2026 at 8:36 PM Yao Zi <me@ziyao.cc> wrote:
> > > Also, previously Huacai expressed preference on delaying devicetree
> > > changes until basic drivers are ready[4], so anyway we should probably
> > > get driver patches merged first.
> > Yes, I confirm that.
> > 
> > Huacai
> > 
> 
> Hi Huacai and Yao,
> 
> I noticed that:
> 1. The current clock driver in mainline has some problems.
>   The pll_ddr is lower than the user_manual,

I'm not sure what do you mean. Do you observe lower clock frequency of
pll_ddr than the frequency specified in TRM (1GHz)? And if so, how?

clk-loongson2 doesn't have the ability to reclock hardware, but only
read out the frequency. PLL frequencies are all up to the bootloader.
So as long as you could confirm the values returned by recalc_rate()
match the register settings, there's nothing wrong in the clock driver.

Reclocking functionality could be introduced later. But even with
reclocking code, I doubt whether the DDR clock could be reclocked
at runtime since it supplies the memory controller.

>   the clk_apb_gate will
>   turn off by kernel while booting,though 16100000.serial is using

This is unlikely an issue in the clock driver, but rather the consumer
is doing something wrong, though I haven't seen similar issues when
working on the clock driver.

Please try booting the kernel with clk_ignore_unused, and check
/sys/kernel/debug/clk/clk_summary to see whether the serial correctly
acquires the apb gate clock. If not, one (and the most possible) reason
is both clock-frequency and clocks properties are specified in its
devicetree node, where 8250 driver would ignore the latter.

> 2. eiointc support for 2k0300 is missing.

This is expected. IOCSRs found on 2K0300 have a quite different layout
than previous generations of Loongson SoCs, and EIOINTC is in fact a
device located in IOCSR addressing space. We need to come up with a
better way to model the IOCSRs in devicetree, and it hasn't been done
yet.

> Is there any WIP (Work In Progress) tree I can follow?
> I'm happy to help with the development or testing.

Sorry there isn't one for now. I'm currently out of my lab, and could
only get things updated this weekend. Sorry for the inconvenience.

Regards,
Yao Zi
