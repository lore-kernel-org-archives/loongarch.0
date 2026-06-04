Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49F62F0680
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584535; cv=none; b=Rsrj9bP6/5XGy0Qzh5zd3Ma1YLPMpRncDHRqgHEJKL1WvDaA6qc00XyUwwuFMlqqxSgxEqvS2cmHTOYzmUcY1pBRKnvXGbXzMv50YVBo6DEQD+9mInPv3oKkokuqXCKzl03g4bqNR/UyPMoYqnl1RlpZ0kKXzO2Gvf8jCLcH9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584535; c=relaxed/simple;
	bh=Oxq6huMUwIi0aY1fVlbexS7N7U/sQi5g7iTxmEu+uHk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=D2GxjlodxalnC1v7AVcFEnWO5wxYp2sZ2UQOFq+pSMWtuA7NgOUfJ28XhOvGhhWIHVOZMytFmqqmhfYWqfN4PJMgDzK7kLpFmVQWVv4YYwMV/lOKflTjnrIs1tlUgZ8Lt/vTX9TxgkXN47i30/4HUBNOtFGUOtHIzLlhDvOi+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KZatwqJX; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KZatwqJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780584529; x=1781189329; i=markus.elfring@web.de;
	bh=Xp8sbcQuxUVlg5hr4mMlEXyd+CaQtISM5d2O4ybh2Iw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KZatwqJXqJ3Hg0UHjg+aZZIUYkbzidmhHGLZ3p0afsJy0ORktmyYS98CXK0bmlTJ
	 Cdp1NCANSviYD1BnHfz8/DdibELVqSACEfQs6jdHL6y0jouIoiDLJBzFowxfpsTVB
	 s5U+53hXrgjSLYuWBFg9NoFvUfhKbN0anHUBUd6ifWMkD6m/7FirZNBhAGGdnKd7k
	 qAPvim4CpxadN+0uNld6hU5lNjQN1SDKj/mZL7pnbIP8BLOELOZiF0qlz6vk0zaFd
	 dK3SfjbgBU5ZDHUR5KlVluRhT1t5e1DeH9VZE33+YC4+oPcKy7AwqlkspLqds0TrF
	 PnquHQ9zIouJyFdcBw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4eGT-1xEUo22r8p-00sD96; Thu, 04
 Jun 2026 16:48:49 +0200
Message-ID: <c36cab4c-0a91-4802-8693-a6ae3cee65b1@web.de>
Date: Thu, 4 Jun 2026 16:48:42 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: loongarch@lists.linux.dev, George Guo <dongtai.guo@linux.dev>,
 Hengqi Chen <hengqi.chen@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Wang Xuerui <kernel@xen0n.name>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/3] LoongArch: More efficient data output in show_cpuinfo()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2hAd6PtjCqhcQaYOuOZoHCIRO+OLB9kPdZMGDkM/K+PeY7uz45P
 EWdT9WU4kXVOmF7RMDUJfGMBGOtbEY6EPvf/vuteBcfw2hKEf/wI+4bdvzxB82Uosif4i/l
 05VrYxZW91lLNzp1Q2sAbbWZw7xfHq+74yOZMco6WzWcJDIpis3YKy6BJYyoQ2z7KLCl/Zp
 AOjsJ9VxTH16fVnn71w/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9Zzdu+dQ5WA=;zn8TNgdATorpWbIQ5E0HWMnLLkn
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 16:40:05 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Simplify data output
  Delete unnecessary braces
  Combine two seq_puts() calls

 arch/loongarch/kernel/proc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

=2D-=20
2.54.0

