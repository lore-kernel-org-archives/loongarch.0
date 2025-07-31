Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CECB23A578
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753929031; cv=none; b=CpVCaM3An+4aMgQErUo4hTCEu3Y7Ly0qNTbOpbuiCAe5s4dj8GlRQgV29pp4Z3Ps/2vXvrVL6rpQLuKRGeIyBecRjoaTKqkimUiFYssld2rE+IvwDlAg2hFJoNzlLV1iAbzAhBYccdc+z32K/N/MS1aQXp83VRFdiZAXNz0JVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753929031; c=relaxed/simple;
	bh=WXtX3eKHJBxlucYmmqLR64PhJA6HcWf6gkWb0smL0oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk7wln3SCWYvEN7CiQ+/ZydqKuK7hx9nunnCOSXlMyyvL59JyAremfjF1M2dHVu3EMG4k8/24HcrbweTqp9Kgrzbl6u3Tt59z4WWdZgAuIJCZz5eG7UuY95RZfQ7qgCLofPpR8/4O+AoN3BWZcqyIZrHaVSSOq4sZI3BbttIAS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4f2319366db611f0b29709d653e92f7d-20250731
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:276455f0-f68b-4ea5-8df2-a6fe12529ece,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:6
X-CID-INFO: VERSION:1.1.45,REQID:276455f0-f68b-4ea5-8df2-a6fe12529ece,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:6493067,CLOUDID:94de684a21d748a2aa6767a278d8fe90,BulkI
	D:250731102951I0I94QDZ,BulkQuantity:1,Recheck:0,SF:17|19|24|45|64|66|78|80
	|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:ni
	l,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,B
	RR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_ULS,
	TF_CID_SPAM_SNR
X-UUID: 4f2319366db611f0b29709d653e92f7d-20250731
X-User: duanchenghao@kylinos.cn
Received: from localhost [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1326998802; Thu, 31 Jul 2025 10:30:22 +0800
Date: Thu, 31 Jul 2025 10:29:58 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: bpf selftest build error - undeclared function
 'bpf_qdisc_skb_drop'
Message-ID: <20250731022958.GA190477@chenghao-pc>
References: <CAK3+h2z3Zx+0KbVcRbLuz_-LhBwov9Bmvp9HdumbaN5GYtovFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK3+h2z3Zx+0KbVcRbLuz_-LhBwov9Bmvp9HdumbaN5GYtovFg@mail.gmail.com>

On Wed, Jul 30, 2025 at 07:21:52PM -0700, Vincent Li wrote:
> Hi Tiezhu and Chenghao,
> 
> While attempting to test the bpf trampoline patches on loongarch on
> top of https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git,
>  I ran into bpf selftest build error irrelevant to the bpf trampoline
> 
>   CLNG-BPF [test_progs] bpf_qdisc_fail__incompl_ops.bpf.o
> progs/bpf_qdisc_fail__incompl_ops.c:13:2: error: call to undeclared
> function 'bpf_qdisc_skb_drop'; ISO C99 and later do not support
> implicit function declarations [-Wimplicit-function-declaration]
>    13 |         bpf_qdisc_skb_drop(skb, to_free);
>       |         ^
> 
> I am on Fedora 38 ( I should have updated to newer Fedora :)) with
> clang version 18.1.0rc, not sure if it is related, wonder if you guys
> have run into similar issues.
> 
> Vincent

Hi Vincent,

Yes, I have encountered a similar issue. My approach is to temporarily
block or comment out the test code that is unrelated to the trampoline
test.

Chenghao
