Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1E82772C
	for <loongarch@lists.linux.dev>; Fri,  6 Oct 2023 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mailo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b="F1xvBXAV"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1696617986; bh=RYszOFam6KVl1ypA3hz/Gcl2MPX05Hk70/Nt/veHpOM=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=F1xvBXAVWvtXxgW1QQNTe41Wrl1V8lgkOuvedF2t9O0VLnM/P4+c/KixHwe0EMhNF
	 iVsVYf9i9rpf288wnN0fDJ++tNtL5+KqkRvkONOwM5R0Xpkry+Wuq0N0tan+ZP3yWB
	 EAMt6nYiQZHghB6vvGwhbpkJyXeF/SiqIfLMS4Iw=
Received: by b221-1.in.mailobj.net [192.168.90.21] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri,  6 Oct 2023 20:46:26 +0200 (CEST)
X-EA-Auth: wLkTObUMxPeiTYFDpw6KkYlMjjTpxPawCOc5bmQzZOsGoLzdy2ksD4xiQuNg42zWt+KIKqlCXA9oIB3RokB0KAtS6XdsuVA+
Date: Sat, 7 Oct 2023 00:16:18 +0530
From: Deepak R Varma <drv@mailo.com>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Ira Weiny <ira.weiny@intel.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: kmap() transformation: Question about copy_user_highpage
Message-ID: <ZSBV+h/gjPWV7+Gj@runicha.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
I am attempting to work on replacing the kmap[_atomic]() calls by
kmap_local_page() function call. A detail on this change can be found here [0].

I would like to know if this function: 
	arch/loongarch/mm/init.c::copy_user_highpage()
is currently in use or is it a dead code?

If this code is not in use, can this be removed instead? However, if it is in
use, can you comment why kmap_atomic() was preferred over kmap()
function call?

[0] https://lore.kernel.org/all/20201029222652.302358281@linutronix.de/

Thank you,
Deepak.


