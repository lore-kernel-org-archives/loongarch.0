Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB832F52
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 12:46:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx702Zd6xiZJVIAA--.12677S2;
	Fri, 17 Jun 2022 20:46:18 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org,
	alexs@kernel.org,
	bobwxc@email.cn,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	corbet@lwn.net,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	linux-doc@vger.kernel.org,
	siyanteng01@gmail.com,
	loongarch@lists.linux.dev
Subject: [PATCH v4 0/2] docs: Improve loongarch documents
Date: Fri, 17 Jun 2022 20:47:53 +0800
Message-Id: <cover.1655469906.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9Dx702Zd6xiZJVIAA--.12677S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur4DWF1xZr4Dur1DGw4xtFb_yoWfWrg_uF
	Z7Jay5Aw42gFyrWaySkr13AF98JF4j93W5CF1ktFZFkFyIyrsxZr4DGrWFvr1IqFsrurZ8
	KrWkXryrAr12qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
	0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUeWlkDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

v4:
Modify commit message.

v3:
Modify Subject.

v2:
Fix ``inline literals``.
Delete "注：" of zh_CN patch.
Add fix tag.

v1:
Rewrite all the notes in the loongarch document.
Note is an admonition, let's use the directives
implemented in the reference reStructuredText parser.
About reStructuredText Directives,
see <https://docutils.sourceforge.io/docs/ref/rst/directives.html>

Yanteng Si (2):
  docs/LoongArch: Fix notes rendering by using reST directives
  docs/zh_CN/LoongArch: Fix notes rendering by using reST directives

 Documentation/loongarch/introduction.rst      | 15 ++++++++-----
 Documentation/loongarch/irq-chip-model.rst    | 22 +++++++++++--------
 .../zh_CN/loongarch/introduction.rst          | 14 +++++++-----
 .../zh_CN/loongarch/irq-chip-model.rst        | 14 +++++++-----
 4 files changed, 38 insertions(+), 27 deletions(-)

-- 
2.27.0

