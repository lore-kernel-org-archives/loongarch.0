Received: from smtps.ntu.edu.tw (smtps.ntu.edu.tw [140.112.2.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D12459DD
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.112.2.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762318432; cv=none; b=G2NaptEJLDMKkA/7AQekmjRPdYbUThoY4caOixqPYkk8cxJsa8znbl8vA9aYooF3Qgpux6uRU7k+datTM7QhoLML4YOGX+oPKUF/qfPudc+Cs9zGXRYlgaaPqafrl/dd5/IUNxaL+U3S6fxfnPNDdTp8HX/mUuuWuVu+0pqZTLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762318432; c=relaxed/simple;
	bh=KL7ZKaYNv/bzLovyJbNjasz/Zqv0zzGXIAt912Kig/g=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DzuJEhVvVJOAqYx6p9rfuITo4Vy7jSFQ3J3bIN5L4zZMDNZ+cZehqitcNaGelz+THWNZhyOQCQVuTF+VyX1b0Yxbn7kKaZQmEbEjVhoaWWiynf9n1HIFD2qAMXycp8F7EoCXQGR7SH0zVMIB0pU+S/lNJTl5LRZTEk52y1AWj0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw; spf=pass smtp.mailfrom=ntu.edu.tw; arc=none smtp.client-ip=140.112.2.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ntu.edu.tw
Received: from wmail1.cc.ntu.edu.tw (wmail1.cc.ntu.edu.tw [140.112.2.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 088813201F;
	Wed,  5 Nov 2025 12:53:36 +0800 (CST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 12:53:36 +0800
From: Bill Tsui <b10902118@ntu.edu.tw>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, oleg@redhat.com, kernel@xen0n.name,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: ptrace: Merge ptrace_hbp_set_*()
In-Reply-To: <429e94ee-ee77-3a5c-a2f7-c0d027fb7c4c@loongson.cn>
References: <20251029153649.33345-1-b10902118@ntu.edu.tw>
 <CAAhV-H5E79jZ9rMYyP3h+KLX5rDGcB-Ec8WqyAhPC-pvuvv5UQ@mail.gmail.com>
 <429e94ee-ee77-3a5c-a2f7-c0d027fb7c4c@loongson.cn>
User-Agent: Roundcube Webmail/1.4
Message-ID: <34516b92c4e5be92e3f740f167f65431@ntu.edu.tw>
X-Sender: b10902118@ntu.edu.tw
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Tiezhu,

> If there is no functional change, just to refactor the code or
> avoid the potential issues, please give a explicit description.
> We will test GDB to see whether there is a regression.

Yeah, just a refactor without functional change. I should have been
more explicit about the intent and that LoongArch doesn't share the
bug.

Let me resent the patch with clearer commit message.

Thanks,
Bill
