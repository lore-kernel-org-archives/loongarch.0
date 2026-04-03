Received: from sender-op-o18.zoho.eu (sender-op-o18.zoho.eu [136.143.169.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785073B95F0
	for <loongarch@lists.linux.dev>; Fri,  3 Apr 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775226138; cv=pass; b=rVtmmoI5/9TO3SiQO9WBZvdBfR+G19b7v4v5ZzwA88I96GnvGfis4cTwhLTdShfQuH8xHr+4oKoinPuXoPlaNGMOgkc+fH2WFhvXXifNrAZqzsiHEUQhgxfvD3YYJ2XWM6EqRN95W6l1ex8ph73layaBgm+6mXVPhGHl1ywAs+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775226138; c=relaxed/simple;
	bh=5XfZLHW917GPeLmoi8RTcOFMV7PSrf1WdMyL1/K92YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9MIti/Sd/Le0CfJvya9qh6dq9mMAWiBem2V6nvVWKKsbJVG0QNCjryXUGpLZixl+nARATT859Dua79Uz+Ts8PwghzvfbrF9gI4vFPaUxTBs5RohuCeFn2KYg2AGGDEhVfw581OrnNu+6G+g32fPBcnCQ8WH7FmC/s7xkbtSSvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trained-monkey.org; spf=pass smtp.mailfrom=trained-monkey.org; arc=pass smtp.client-ip=136.143.169.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trained-monkey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trained-monkey.org
ARC-Seal: i=1; a=rsa-sha256; t=1775223288; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=XsFx4p5VgwLYs8/vuiRIhFYYY7BZEtsdweYoyutsI5s268xHDZNE+1aosDKf5tOhWsVRislQ2rdBSUSa3fCzPaXhQ7Jdtd14qGY8D0s0mK+KI8/ZOgGLtIlFsNetysymzkEm9B+sJUcbGoymfigIjm3FIkkIgaoeHQH/4ENLOjY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1775223288; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=InLCCKin5kc31jhHqJ2/xj58R/AdCjuyS3cbeNCAucg=; 
	b=lR3dFmcub3ObCAdL18l5iaak8Gdiovaq3Tlv5KCFP7EBHANgryMrZkVOEJB8fSUW5MlwFmvffcCYzAUr4kG8Ob5saqKe5ZMxR7XXQMzbCi79zRQMOFW+87zJDova5JdrpCtyj2UlIF+m1T9nJVioaY+neqHcxDVDkzKGLqW3R6o=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=jes@trained-monkey.org;
	dmarc=pass header.from=<jes@trained-monkey.org>
Received: by mx.zoho.eu with SMTPS id 1775223284898804.3284909269775;
	Fri, 3 Apr 2026 15:34:44 +0200 (CEST)
Message-ID: <ec7e71f6-7e95-4f22-8b80-d0925d5bd9c8@trained-monkey.org>
Date: Fri, 3 Apr 2026 09:34:38 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] eth: remove the driver for acenic / tigon1&2
To: Greg KH <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, bhelgaas@google.com,
 dakr@kernel.org, kwilczynski@kernel.org, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 ebiggers@google.com, ardb@kernel.org, tiwai@suse.de, tytso@mit.edu,
 enelsonmoore@gmail.com, martin.petersen@oracle.com, jirislaby@kernel.org,
 geert@linux-m68k.org, herbert@gondor.apana.org.au, vineethr@linux.ibm.com,
 lirongqing@baidu.com, kshk@linux.ibm.com, vadim.fedorenko@linux.dev,
 dong100@mucse.com, wangruikang@iscas.ac.cn, hkallweit1@gmail.com,
 kees@kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260402183029.1236713-1-kuba@kernel.org>
 <2026040357-flick-coil-0c5d@gregkh>
Content-Language: en-US
From: Jes Sorensen <jes@trained-monkey.org>
In-Reply-To: <2026040357-flick-coil-0c5d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/3/26 4:48 AM, Greg KH wrote:
> On Thu, Apr 02, 2026 at 11:30:29AM -0700, Jakub Kicinski wrote:
>> The entire git history for this driver looks like tree-wide
>> and automated cleanups. There's even more coming now with
>> AI, so let's try to delete it instead.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Jes Sorensen <jes@trained-monkey.org>

