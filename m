Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28AB14E2FA
	for <loongarch@lists.linux.dev>; Mon,  2 Sep 2024 06:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725257981; cv=none; b=gOcoKf7QeTVCXRLMN+p0bZ1TXzUVCQuWm4eD6AIGhu0ttWZkBiEvK2lJ0y593VpwZezINtpnOILchsQ9ekN5XE0fpBxXb4Lh8FqqB+ZDMYcVZKschghXZb949hJH6Lxtf3WUjEpg3OW2z4HHjV6imhG0P0YWwRsXqHRp3J+wC2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725257981; c=relaxed/simple;
	bh=67XBHzOk5D5qjbAgaxjj54HcSeehB3J7Kc4PFUNyQKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Su7OjXgrXnafMG1yTP94FU84Vw10ix6/ctZRtcWflogc8vnzfB2exLzE3EQdEtPRij/c9dALCd9tGTJLjxOlZhg1L5W3Rh1K2vuoAJ+vEGKnlDgG9AzBxeyGw7Ko7GiJqcJ/cBbHW3PGEcUw8zl/ZRlJu1rFgFZQ+f+7nToVBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wxz9y3zggz9sSN;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oh9ReoBVOWjB; Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wxz9y2zjLz9sSH;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50A268B76C;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gAfIussLeGez; Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from [192.168.234.158] (PO19952.IDSI0.si.c-s.fr [192.168.234.158])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B2F1A8B763;
	Mon,  2 Sep 2024 08:19:33 +0200 (CEST)
Message-ID: <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
Date: Mon, 2 Sep 2024 08:19:33 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-um@lists.infradead.org, kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1725223574.git.osandov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Omar Sandoval <osandov@fb.com>
> 
> Hi,
> 
> I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> destination address is in userspace and x86 Supervisor Mode Access
> Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> renames a helper function so that its use in patch 2 makes more sense.
> If the rename is too intrusive, I can drop it.

The name of the function is "copy_to_kernel". If the destination is a 
user address, it is not a copy to kernel but a copy to user and you 
already have the function copy_to_user() for that. copy_to_user() 
properly handles SMAP.

Christophe


> 
> Thanks,
> Omar
> 
> Omar Sandoval (2):
>    mm: rename copy_from_kernel_nofault_allowed() to
>      copy_kernel_nofault_allowed()
>    mm: make copy_to_kernel_nofault() not fault on user addresses
> 
>   arch/arm/mm/fault.c         |  2 +-
>   arch/loongarch/mm/maccess.c |  2 +-
>   arch/mips/mm/maccess.c      |  2 +-
>   arch/parisc/lib/memcpy.c    |  2 +-
>   arch/powerpc/mm/maccess.c   |  2 +-
>   arch/um/kernel/maccess.c    |  2 +-
>   arch/x86/mm/maccess.c       |  4 ++--
>   include/linux/uaccess.h     |  2 +-
>   mm/maccess.c                | 10 ++++++----
>   9 files changed, 15 insertions(+), 13 deletions(-)
> 
> --
> 2.46.0
> 
> 
