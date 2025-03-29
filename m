Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B212CDAE
	for <loongarch@lists.linux.dev>; Sat, 29 Mar 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241913; cv=none; b=lA/GDrE5dCZpaPvFwgRUjkNV0RRRlRLMiq1ESXSYnCZOrzCK6zRvcUcq72W76T7w20qSkk4LBTULM2mzyKSt3S6c5EQMR86SEDt2yqqCDHcRumV9jiHA8aCl6Zr+auw8oJ7SF+dnD18lDdbbupdILppQNL0OmsR0MFNKjyBKFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241913; c=relaxed/simple;
	bh=uO0d9BIDO/bpbSee2FKDT0UDLR8JNdmMg5johFY31FI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=FbJprQEGgTEVr6lMOXqvmwpORzYcZTZ3ks+lQ/kLHZ4tE58UiEYlL1iqI7bwxHcx2/y0/U5JiflgjY6guoLK03JpBgwP9qrS7WuxhJMhVKr3dPIvDk4+9mfpt2NHzNr6icSuCevFl6gQzxu/1ST+TQK04QwOvGDPSABAERcagr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=rAkIRY4L; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="rAkIRY4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743241907; bh=uO0d9BIDO/bpbSee2FKDT0UDLR8JNdmMg5johFY31FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rAkIRY4LzBvHMIFX6uYhFRc6QwIl8wZp5BvcqlCORwu7UbxLFB6izBOgv7Ta/KDXB
	 cj4oPgIpi2cVTH6Tz5XVv7YhkDeRTwQok93P4uFoufg5rPMIETguae8+PCS4SFDGbt
	 TwZMfRh3k8znghlr++zCjyH6hgnld6OZSrPgmu28=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id B322E276; Sat, 29 Mar 2025 17:44:50 +0800
X-QQ-mid: xmsmtpt1743241490tcmriygi4
Message-ID: <tencent_928F84F5CCDFC9B34B7BCACF5CA00FED5006@qq.com>
X-QQ-XMAILINFO: MS1AjjpKGz7zRbIxx+8FqvSySv5AXR1Lmczx1Nt7aCHo87XWcgg8G0EVJOaogC
	 xoCgfKRUze0yM6BvTD1elL3nJujcnfp3GTNhUvQHTcPSmCUg4+QUEGgnl7M3eSw3/G0BeTrjra2z
	 xYs17lUibplv4iZmETmvQwYA81FJW5oi8JIb8E9QCrrzmE04EMUQoSQHt5qkw/o/AlwCw0dNe8aK
	 NlryLNuW2/oP2eUkL0peUmRtGxZhSFtngcdSknY/CZ3zBnFyN+jazuFwvFDz92mvLxzRL+jWUyhu
	 3HzZ3nGNMhnKmLEQCxFeHFyM+lnZem/52sSGZ+DTNYAydBm2cXHET0HL8FuOTaRegSSEbS6K0mFS
	 lMNLU4OvoH+yxe++I/7/nsopNFD3H1JeJh8x9ZQpdkezfHQEXpUMBel7LFVYumNhn5gQFIJjCWID
	 bVr7BJg3PbEBLs6del7AnFWq+A3twoRaJrHfct9qVpBd8iwSlNgwgC5PjqUydCJ/WamXrrpoTos+
	 9io9kpB8wijNSD3V75uLmhN7d3McYejqdt7KiCskIwuqCbY4/4xS6lzSTiPZe9Yc/xx/fpCozClM
	 veDhqjtNuLK8RSh1sc3bGYgmqdU5xj53CC30FzgiE3+8C4mxuj1/+yk9E1gh7smbjfgAc2VsB1YV
	 6eD//ilmQs69FDW+bQDpERqNjDwORNfx6196w8nBVLd/CWvfn0NiAp/3na2tWA9Duo3c/t9KLs0T
	 6ZpHRhudjdWPovKX1nQh9C9ZGoLStGde/Pjay7P6/CttbWP7RYTo8bzJ+7JXEeQUWdqNPAsoQsPm
	 5QqGgzbFVn7towYOgS6nDq+vCBQBLe/tzapqBGq+MlwDNM4Sg0UHlzAl2KlBTDtDitgF/fbGZbYm
	 Y5d6V0gNtHZ2ocyGS5oip+PN3xlHTn93l/MzsPzH5XOHSmaLFzovPx7d0oFZVZuR7+ZI6bHxEw1s
	 V+5e9Jm5fXdR9GFvngLg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: chenhuacai@kernel.org
Cc: Yeking@red54.com,
	guoren@kernel.org,
	jiaxun.yang@flygoat.com,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: Re: [PATCH] LoongArch: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Sat, 29 Mar 2025 09:44:47 +0000
X-OQ-MSGID: <20250329094448.74837-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhV-H5T3DLFfzPg4Zgzn7JbzqoNZdYn5_F06QNHS230xq-1MA@mail.gmail.com>
References: <CAAhV-H5T3DLFfzPg4Zgzn7JbzqoNZdYn5_F06QNHS230xq-1MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Huacai,

> How about replace "to the built-in command line" with "with the
> built-in command line" and keep others unchanged?
It seems that the use of the preposition "with" does not conform to the regular
collocation of "append" and may lead to ambiguity.
You can consult an LLM such as DeepSeek, Qwen, or ChatGPT.

Zhibang

