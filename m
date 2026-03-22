Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A98332638
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 16:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197220; cv=none; b=noiAlvJMp3lIQraYwJS3iUbP42Bs0Zg0HYGdhuegTcn2XF2CoIztL05WyQHbd6FAHsi/w/1iHWHgCfvzaxKPz8nf53fmJUTOuLKUimR6z0L6KVIYuFi1tqB9KBqySfTcGET0C4UIW4snO2dk4n3urN2dpQzHQP1/PdFyV2Emvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197220; c=relaxed/simple;
	bh=/f+ODEMe9MqDUSEhrPEyaS3c6pNJWP+UrwJzzxpbq7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uy3qePcN9KuibRoTx4//kPhQWc9eoRFH1pN+a5Qx99KuA4OGuuj576zyW2ci4Vf7/h2JB596faSx5sFk1C69iFRu2gqUC6DZp68iK+9D2wVIU9AVouhUZlwFBdih+9QI7mEQQGPGuAP2yOnfQZBNIQlDTxPlbSSwutRovNZlsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PH85wew3; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PH85wew3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774197214; bh=fgqbGuBb730kM/CXHiOrLPDeUmjLFpy/x3bfks10UPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PH85wew3G5P05qqfDWWEMRJRfKznMt7hKzF9hM68SKffljkg52d8MUFE1CVvX2Nx+
	 ihXljKPpBFgZ6J4UN4czei8ZaVNjGB/XhIsXPK4DN+2fEkbhbhtRB3EvO4bKE8acN4
	 mH5xLl3oLrNwJboDovUV6mBML2PoQzGn6zSizZfw=
Received: from [192.168.1.123] ([122.195.139.226])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 85FB30CB; Mon, 23 Mar 2026 00:33:31 +0800
X-QQ-mid: xmsmtpt1774197211thrz2obhv
Message-ID: <tencent_CA7176E8823B957F1AEB15254D17904D5505@qq.com>
X-QQ-XMAILINFO: OK7NBzdNss/RCzvQ9fuOZiZU3jQ8HmXYuNzaUjmM8AW1pcSQ1js37eMi24bAAE
	 hZd9hgzDsKTDPG+fLX+YxWYluNADS9nS8oGYVEKy5LS3sSSVjcmRLhsnwn6gcjjOEEWzXpFJzijD
	 9mDwTc+L5K9x18ky59K9UN+zCBTly1d4LIGpGTUB8o/LoOs3wIzH6LhEat6LlkvzM/DhOCxEcjLX
	 PVX8OT02tZsbzUnVEJU3ZUyrVp1K2epxlbJXRnK66cZI418VQOaUQuoOxw9F4zkKIUt5qXY1SHtc
	 NtaTIAwMZtREP7kSJKqfqI7NJVpozxtSVrAeq3s7jdmN8LHMR5j9hykhROokGzlkrGsiW5t18oDp
	 guKXu72VwW4NBMZKZ0HKjNafEB65BBE6wrmyxWNi5Wdw8ImEBPUHNrOHblciaZ3+i8vnB49Hlcpr
	 skutC+HhGlEAMzxDbpXf4azL/qsTxRFHAEZa0o1rRLtKwgXzVgPS4wTypWi3xnAwRT29pD1Ul2Tu
	 oM8BmpypptwzOWLJU5YM8FJSEAmUiWmjceC29QRRWfTaX2cC0jtzFoHY5Pe4kvSl80sT2BFx6YnG
	 ZpxlVyR/tNmTEM0PxhypzgED2BX7OAJUYRTKR8wFivA+Q7JA5tP+lSKd3NO5ca6MvzBgUrkwBkfA
	 +EmV47RVPNUQzbNgHwfVOxS4/2cvgeZZlm2f1A8b9fAQYf0jsKb7/QfjRh8LSFgWZYgADLVbYZa8
	 FCioEXWpyjuC2x2UJkvqP3Mj21QFs77UeuMTnEuVtb0zHPuyGMCzEwwPghuGArxvVJOQyqi3pkEm
	 TLEdTB70el/faIjlDUdl2PUzXSBXL4vLh2IRvXmizFM7gNSp11Uqs+sb/+Up+cX9O1YBZ/A6HyoF
	 sYn5WmFxQosvjd6TvT4gw9OHzTQ/ykvaPrwA/whYKJ2AaO4/E/4QuAkTkQOaVvlkKe9+pUc6Fq/d
	 hb++0Ef6F5mfg5JcRepbk6gao1Ue/wHSce9ntuF4/OAZv6hwVCuTgAMFnH5NMcvq9xSPipteTzbR
	 k9Q8zhiqFguUyw5XNY
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-OQ-MSGID: <e296ba12-c88c-411c-9983-9e4c93a8eda8@qq.com>
Date: Mon, 23 Mar 2026 00:33:31 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add Loongson-2K0300 processor support
To: Huacai Chen <chenhuacai@kernel.org>, Yao Zi <me@ziyao.cc>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 kernel@xen0n.name, devicetree@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, wjjsn <2858482031@qq.com>
References: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
 <ab_iF2hjZRfp16HP@pie>
 <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
Content-Language: en-US
From: wjjsn <wjjsn@qq.com>
In-Reply-To: <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/22/26 21:15, Huacai Chen wrote:
> On Sun, Mar 22, 2026 at 8:36 PM Yao Zi <me@ziyao.cc> wrote:
>> Also, previously Huacai expressed preference on delaying devicetree
>> changes until basic drivers are ready[4], so anyway we should probably
>> get driver patches merged first.
> Yes, I confirm that.
> 
> Huacai
> 

Hi Huacai and Yao,

I noticed that:
1. The current clock driver in mainline has some problems.
   The pll_ddr is lower than the user_manual,the clk_apb_gate will
   turn off by kernel while booting,though 16100000.serial is using
2. eiointc support for 2k0300 is missing.

Is there any WIP (Work In Progress) tree I can follow?
I'm happy to help with the development or testing.

