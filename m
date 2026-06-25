Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E2367F31
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377222; cv=none; b=WuXvX2gIaqZHgPOCDDFEwACZ6OWZ/zOqzjjPDhgr75DgglNeQ0aMiBbd+26Dmjcm6BYFgjTXPpf6n6pJab2iJ9J/XeTTLDT6qCYiO1X0lIZs2wfXHEXR8vt2f+17JRuwUcY/VhH8j7gZGtVnt0uGe2S5sGlQo8dlB6bN5GKvsSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377222; c=relaxed/simple;
	bh=9AUuMdNt8a1ethXnqnrijquHBTISslIgQzrk9e3NyYo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=R9cZj5S0hkO2eVYsNx+lMd/jfUVwhgMHtnYQ7fwmG866P1/YJh6K28kjfJ0B2npIwMFmSYq7MPxe4lb1+bKiWyE9Shhf7CAEHxGQJmZfbe24DZCpoXi/ie+h8qx1v7ajWUsYDFPHzeyFSHMyCyRSSXVIBOMp2G5O5P6egIrUCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=du4wyvFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="du4wyvFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501611F00A3A;
	Thu, 25 Jun 2026 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782377221;
	bh=Wt19WGGroORa/wioMj0fJmzojKxoKhuinoNaN6kTkuY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=du4wyvFcpe6h8cJqJ8+wwVFQIsPj3+N4yyrOgN/qduox/8HRpcOdji6jhccFrjrVm
	 fe8cWu0TwoYUMUMvAnwH5ORIIJS4JfTppMLZ25rxdQvGMNgIkYe5fdXI5cjcxjOFOi
	 pIVScnjWjkimeuSoBvuRunDdMYJRg2MNpvUeqdBcAvWj4Ajcj47cEbqJxmHXOXTbrq
	 IEEjEz95TyfdFohXIjCZhgHI2OAqNKZ+Zb8mHmPCjMMrPDDcqgvM3Sqf2cNQbIJnHF
	 SHC6Oq2q9FY3gbYFLnSDpvOpnDb4GmBPDmTyTMv6ojjv53h+5tNtueC1cRFQtHQxHf
	 YQHHT5H1S8rpg==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks
 in memblock iteration loops
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrey Konovalov <andreyknvl@gmail.com>, 
 David Hildenbrand <david@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
Date: Thu, 25 Jun 2026 11:46:51 +0300
Message-Id: <178237721125.146960.11801589845266315987.b4-review@b4>
X-Mailer: b4 0.15.2

On Sun, 21 Jun 2026 23:59:10 +0900, Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
> treewide: remove unnecessary invalid range checks in memblock iteration loops
> 
> The memblock API guarantees that for_each_mem_range() and
> for_each_mem_pfn_range() never return an invalid range, meaning start is
> always less than end.
> 
> Several memblock callers still have unnecessary invalid range checks in
> their loop bodies, so remove them.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

